//
//  File.swift
//
//
//  Created by Leo Dion on 12/9/21.
//
import ArgumentParser
import Contribute
import ContributeMailchimp
import Foundation
import Prch
import Tagscriber

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension BrightDigitSiteCommand.ImportCommand {
  struct Mailchimp: ParsableCommand {
    public init() {}

    var contentPathURL: URL {
      URL(fileURLWithPath: exportMarkdownDirectory)
    }

    @Option(help: "Destination directory for markdown files.")
    public var exportMarkdownDirectory: String

    @Option(help: "Mailchimp API Key")
    public var mailchimpAPIKey: String

    @Option(help: "Mailchimp List ID")
    public var mailchimpListID: String

    @Flag
    public var overwriteExisting: Bool = false

    @Flag
    public var includeMissingPrevious: Bool = false

    static func fileNameWithoutExtensionFromSource(_ source: ContributeMailchimp.Newsletter.Source) -> String {
      "\(source.issueNo.description.padLeft(totalWidth: 3, byString: "0"))-\(source.slug)"
    }

    static func sourceFrom(campaign: MailchimpCampaign) throws -> Newsletter.Source.Campaign? {
      guard let subjectLine = campaign.settings?.subjectLine else {
        throw ImportError.newsletterMissingField(.subjectLine)
      }

      let range = subjectLine.range(of: "#(\\d+)", options: .regularExpression)

      let issueNoParsed: Int? = range.map { subjectLine[$0] }.map { substring in
        let startIndex = substring.index(after: substring.startIndex)
        return String(substring[startIndex...])
      }.flatMap { Int($0) }

      guard let issueNo = issueNoParsed else {
        return nil
      }

      let brightdigitSent = campaign.recipients?.segmentText?.contains("brightdigit-business") == true
      let isBrightDigitNewsletter = subjectLine.contains("BrightDigit Newsletter")

      guard brightdigitSent || isBrightDigitNewsletter else {
        return nil
      }

      guard let campaignID = campaign.id else {
        throw ImportError.newsletterMissingField(.id)
      }
      guard let longArchiveURL = campaign.longArchiveURL.flatMap(URL.init(string:)) else {
        throw ImportError.newsletterMissingField(.longArchiveURL)
      }
      guard let title = campaign.settings?.title else {
        throw ImportError.newsletterMissingField(.title)
      }
      let previewText = campaign.settings?.previewText

      guard let sendTime = campaign.sendTime else {
        throw ImportError.newsletterMissingField(.sendTime)
      }

      let featuredImageURL = campaign.socialCard?.imageURL.flatMap(URL.init(string:))

      let slug: String = title.convertedToSlug()

      return Newsletter.Source.Campaign(slug: slug, issueNo: issueNo, campaignID: campaignID, longArchiveURL: longArchiveURL, featuredImageURL: featuredImageURL, title: title, subjectLine: subjectLine, previewText: previewText, sendTime: sendTime)
    }

    public func run() throws {
      let mailchimp = Newsletter.client(withAPIKey: mailchimpAPIKey, usingSession: URLSession.shared)

      let campaigns = try mailchimp.campaigns(fromRequest: .init(listID: mailchimpListID))

      let newsletters = try mailchimp.newsletters(fromCampaigns: campaigns, withFactory: Self.sourceFrom(campaign:), processedWith: BrightDigitSiteCommand.ImportCommand.markdownGenerator.markdown(fromHTML:)).sorted(by: { lhs, rhs in
        lhs.issueNo < rhs.issueNo
      })

      let options: MarkdownContentBuilderOptions = .init(shouldOverwriteExisting: overwriteExisting, includeMissingPrevious: includeMissingPrevious)

      try Newsletter.write(from: newsletters, atContentPathURL: contentPathURL, fileNameWithoutExtension: Self.fileNameWithoutExtensionFromSource(_:), using: BrightDigitSiteCommand.ImportCommand.markdownGenerator.markdown(fromHTML:), options: options)
    }
  }
}
