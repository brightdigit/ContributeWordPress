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

    public func run() throws {
      let api = Spinetail.Mailchimp.API(apiKey: mailchimpAPIKey)!
      let mailchimp = Client(api: api, session: URLSession.shared)
      let markdownProcessing = PandocMarkdownGenerator()

      let campaigns = try mailchimp.campaigns(fromRequest: .init(listID: mailchimpListID))

      let newsletters = try mailchimp.newsletters(fromCampaigns: campaigns, processedWith: markdownProcessing).sorted(by: { lhs, rhs in
        lhs.issueNo < rhs.issueNo
      })

      let options: MarkdownContentBuilderOptions = .init(shouldOverwriteExisting: overwriteExisting, includeMissingPrevious: includeMissingPrevious)

      try Newsletter.write(from: newsletters, atContentPathURL: contentPathURL, options: options)
    }
  }
}
