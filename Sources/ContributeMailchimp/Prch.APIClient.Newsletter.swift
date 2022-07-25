import Contribute
import Foundation
import Prch
import Spinetail
import SwiftTube

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public typealias MailchimpCampaign = Campaigns.GetCampaigns.Response.Status200.Campaigns

public extension Client where APIType == Mailchimp.API {
  func campaigns(fromRequest request: MailchimpCampaignRequest, timeout: DispatchTime = .now() + 10.0) throws -> [MailchimpCampaign] {
    let request = Campaigns.GetCampaigns.Request(count: 1000, status: .sent, listId: request.listID, sortField: .sendTime, sortDir: .desc)
    let response = try requestSync(request, timeout: timeout)
    guard let campaigns = response.campaigns else {
      throw ImportError.invalidMailchimp
    }
    return campaigns
  }

  func htmlFromCampaign(withID campaignID: String) throws -> String {
    let request = Campaigns.GetCampaignsIdContent.Request(campaignId: campaignID)
    let content = try requestSync(request)
    guard let archiveHtml = content.archiveHtml else {
      throw ImportError.missingHTMLForCampaignID(campaignID)
    }
    return archiveHtml
  }

  func source(fromCampaign campaign: MailchimpCampaign, withFactory factory: (MailchimpCampaign) throws -> Newsletter.Source.Campaign?, processedWith htmlToMarkdown: @escaping (String) throws -> String) throws -> Newsletter.Source? {
    guard let campaignProperties = try factory(campaign) else {
      return nil
    }
    let html = try htmlFromCampaign(withID: campaignProperties.campaignID)

    let markdown = try htmlToMarkdown(html)

    return .init(campaign: campaignProperties, html: html, markdown: markdown)
  }

  func newsletters(fromCampaigns campaigns: [MailchimpCampaign], withFactory factory: (MailchimpCampaign) throws -> Newsletter.Source.Campaign?, processedWith htmlToMarkdown: @escaping (String) throws -> String) throws -> [Newsletter.Source] {
    let newsletterResults: [Result<Newsletter.Source?, Error>] = campaigns.map { campaign in
      Result {
        try self.source(fromCampaign: campaign, withFactory: factory, processedWith: htmlToMarkdown)
      }
    }
    return try newsletterResults.compactMap { result in
      try result.get()
    }
  }
}
