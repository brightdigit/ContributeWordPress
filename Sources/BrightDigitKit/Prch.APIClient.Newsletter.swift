import Foundation
import Prch
import Spinetail
import SwiftTube

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public typealias MailchimpCampaign = Campaigns.GetCampaigns.Response.Status200.Campaigns
typealias NewsletterCampaign = Newsletter.Source.Campaign

extension Client where APIType == Mailchimp.API {
  func campaigns(fromRequest request: MailchimpCampaignRequest) throws -> [MailchimpCampaign] {
    let request = Campaigns.GetCampaigns.Request(count: 1000, status: .sent, listId: request.listID, sortField: .sendTime, sortDir: .desc)
    let response = try requestSync(request)
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

  func newsletters(fromCampaigns campaigns: [MailchimpCampaign], processedWith markdownProcessing: PandocMarkdownGenerator) throws -> [Newsletter.Source] {
    let newsletterResults: [Result<Newsletter.Source?, Error>] = campaigns.map { campaign in
      let campaignProperties: NewsletterCampaign?
      let html: String
      let markdown: String

      do {
        campaignProperties = try NewsletterCampaign(campaign: campaign)
      } catch {
        return .failure(error)
      }

      guard let campaignProperties = campaignProperties else {
        return .success(nil)
      }

      do {
        html = try self.htmlFromCampaign(withID: campaignProperties.campaignID)
      } catch {
        return .failure(error)
      }

      do {
        markdown = try markdownProcessing.markdown(fromHTML: html)
      } catch {
        return .failure(error)
      }

      return .success(.init(campaign: campaignProperties, html: html, markdown: markdown))
    }
    return try newsletterResults.compactMap { result in
      try result.get()
    }
  }
}
