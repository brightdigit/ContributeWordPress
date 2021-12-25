//
//  File.swift
//
//
//  Created by Leo Dion on 12/9/21.
//
import ArgumentParser
import Foundation
import Prch
import Spinetail

public struct NewsletterMarkdownContentURLGenerator: ContentURLGenerator {
  public func destinationURL(basedOn source: Newsletter, atContentPathURL contentPathURL: URL) -> URL {
    contentPathURL.appendingPathComponent("\(source.issueNo.description.padLeft(totalWidth: 3, byString: "0")).\(source.slug)").appendingPathExtension("md")
  }

  public typealias SourceType = Newsletter
}

public struct NewsletterMarkdownExtractor: MarkdownExtractor {
  public func markdown(from source: Newsletter) throws -> String {
    source.markdown
  }

  public typealias SourceType = Newsletter
}

public struct NewsletterFrontMatterTranslator: FrontMatterTranslator {
  public func frontMatter(from source: Newsletter) -> FrontMatter {
    FrontMatter(issueNo: source.issueNo, campaignID: source.campaignID, featuredImage: source.featuredImageURL, longArchiveURL: source.longArchiveURL, newsletterTitle: source.title, title: source.subjectLine, date: YAML.dateFormatter.string(from: source.sendTime), description: source.previewText)
  }

  public typealias FrontMatterType = FrontMatter

  public typealias SourceType = Newsletter

  public struct FrontMatter: Codable {
    let issueNo: Int
    let campaignID: String
    let featuredImage: URL?
    let longArchiveURL: URL
    let newsletterTitle: String
    let title: String
    let date: String
    let description: String?
  }
}

public extension Result {
  @inlinable func tryMap<NewSuccess>(_ transform: (Success) throws -> NewSuccess) -> Result<NewSuccess, Failure> where Failure == Error {
    flatMap { success in
      Result<NewSuccess, Error> {
        try transform(success)
      }
    }
  }
}

public struct Newsletter {
  let slug: String
  let issueNo: Int
  let campaignID: String
  let longArchiveURL: URL
  let featuredImageURL: URL?
  let title: String
  let subjectLine: String
  let previewText: String?
  // let templateId : String
  let sendTime: Date
  let html: String
  let markdown: String
}

extension Result {
  func unwrap<NewSuccess>(orError error: @autoclosure () -> Failure) -> Result<NewSuccess, Failure> where Success == NewSuccess? {
    flatMap { success in
      guard let value = success else {
        return .failure(error())
      }
      return .success(value)
    }
  }
}

public extension BrightDigitSiteCommand.ImportCommand {
  struct Mailchimp: ParsableCommand {
    public init() {}

    var contentPathURL: URL {
      URL(fileURLWithPath: exportMarkdownDirectory)
    }

    @Option(help: "Destination directory for markdown files.")
    public var exportMarkdownDirectory: String
    fileprivate func extractedFunc(_ campaigns: [Campaigns.GetCampaigns.Response.Status200.Campaigns], _ mailchimp: APIClient<URLSession>, _ markdownProcessing: PandocMarkdownGenerator) throws -> [Newsletter] {
      let semaphore = DispatchSemaphore(value: 1)
      let group = DispatchGroup()
      var newsletterResults: [Result<Newsletter?, Error>?] = .init(repeating: nil, count: campaigns.count)
      for (index, campaign) in campaigns.enumerated() {
        guard let subjectLine = campaign.settings?.subjectLine else {
          newsletterResults[index] = .failure(ImportError.newsletterMissingField(.subjectLine))
          continue
        }

        print(subjectLine)

        let range = subjectLine.range(of: "#(\\d+)", options: .regularExpression)

        let issueNoParsed: Int? = range.map { subjectLine[$0] }.map { substring in
          let startIndex = substring.index(after: substring.startIndex)
          return String(substring[startIndex...])
        }.flatMap { Int($0) }

        guard let issueNo = issueNoParsed else {
          newsletterResults[index] = .success(nil)
          continue
        }

        let brightdigitSent = campaign.recipients?.segmentText?.contains("brightdigit-business") == true
        let isBrightDigitNewsletter = subjectLine.contains("BrightDigit Newsletter")

        guard brightdigitSent || isBrightDigitNewsletter else {
          newsletterResults[index] = .success(nil)
          continue
        }

        guard let campaignID = campaign.id else {
          newsletterResults[index] = .failure(ImportError.newsletterMissingField(.id))
          continue
        }
        guard let longArchiveURL = campaign.longArchiveURL.flatMap(URL.init(string:)) else {
          newsletterResults[index] = .failure(ImportError.newsletterMissingField(.longArchiveURL))
          continue
        }
        guard let title = campaign.settings?.title else {
          newsletterResults[index] = .failure(ImportError.newsletterMissingField(.title))
          continue
        }
        let previewText = campaign.settings?.previewText

        guard case let DateTime.some(sendTime) = campaign.sendTime else {
          newsletterResults[index] = .failure(ImportError.newsletterMissingField(.sendTime))
          continue
        }

        let slug: String
        do {
          slug = try title.convertedToSlug()
        } catch {
          newsletterResults[index] = .failure(error)
          continue
        }

        let imageURL = campaign.socialCard?.imageURL.flatMap(URL.init(string:))
        //        print(campaign.webId)
        //        print(campaign.settings?.title)
        //        print(campaign.settings?.subjectLine)
        //        print(campaign.settings?.previewText)
        //        print(campaign.settings?.templateId)
        //        print(campaign.sendTime)
        group.enter()
        semaphore.wait()
        mailchimp.request(Campaigns.GetCampaignsIdContent.Request(fields: nil, excludeFields: nil, campaignId: campaignID)) { result in

          semaphore.signal()
          let htmlResult = result.map { $0.success?.archiveHtml }.mapError { $0 as Error }.unwrap(orError: ImportError.missingHTMLForCampaignID(campaignID))
            .tryMap { html in
              try (html, markdownProcessing.markdown(fromHTML: html))
            }.map { args -> Newsletter? in
              let (html, markdown) = args
              return Newsletter(slug: slug, issueNo: issueNo, campaignID: campaignID, longArchiveURL: longArchiveURL, featuredImageURL: imageURL, title: title, subjectLine: subjectLine, previewText: previewText, sendTime: sendTime, html: html, markdown: markdown)
            }
          newsletterResults[index] = htmlResult
          group.leave()
        }
      }
      group.wait()
      return try newsletterResults.compactMap { result in
        try result!.get()
      }
    }

    public func run() throws {
      let api = MailchimpAPI(apiKey: "43df11e28376f218e70125a5c7f4f5c8-us12")!
      let mailchimp = APIClient(api: api, session: URLSession.shared)
      let semaphore = DispatchSemaphore(value: 0)
      let markdownProcessing = PandocMarkdownGenerator()
      var campaignsResult: Result<[Campaigns.GetCampaigns.Response.Status200.Campaigns], Error>!
      mailchimp.request(Campaigns.GetCampaigns.Request(fields: nil, count: 1000, offset: nil, type: nil, status: .sent, beforeSendTime: nil, sinceSendTime: nil, beforeCreateTime: nil, sinceCreateTime: nil, listId: "584d0d5c40", folderId: nil, memberId: nil, sortField: .sendTime, sortDir: .desc)) { result in
        campaignsResult = result.map {
          $0.success?.campaigns
        }.mapError { $0 as Error }.unwrap(orError: ImportError.invalidMailchimp)
        semaphore.signal()
      }
      semaphore.wait()
      let campaigns = try campaignsResult.get()

      let newsletters = try extractedFunc(campaigns, mailchimp, markdownProcessing)
      let contentBuilder = MarkdownContentYAMLBuilder(
        frontMatterExporter: FrontMatterYAMLExporter(translator: NewsletterFrontMatterTranslator()),
        markdownExtractor: NewsletterMarkdownExtractor()
      )

      for newsletter in newsletters {
        print(newsletter.title)
        print(newsletter.subjectLine)

        try contentBuilder.write(from: newsletter, atContentPathURL: contentPathURL, basedOn: NewsletterMarkdownContentURLGenerator())
      }
    }
  }
}
