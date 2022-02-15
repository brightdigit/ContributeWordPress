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
    let semaphore = DispatchSemaphore(value: 0)
    var campaignsResult: Result<[Campaigns.GetCampaigns.Response.Status200.Campaigns], Error>!
    self.request(Campaigns.GetCampaigns.Request(fields: nil, count: 1000, offset: nil, type: nil, status: .sent, beforeSendTime: nil, sinceSendTime: nil, beforeCreateTime: nil, sinceCreateTime: nil, listId: request.listID, folderId: nil, memberId: nil, sortField: .sendTime, sortDir: .desc)) { response in
      let result = Result(response: response)
      campaignsResult = result.map(\.campaigns).mapError { $0 as Error }.unwrap(orError: ImportError.invalidMailchimp)
      semaphore.signal()
    }
    semaphore.wait()
    return try campaignsResult.get()
  }

  func htmlFromCampaign(withID campaignID: String) throws -> String {
    var result: Result<String, Error>!
    let semaphore = DispatchSemaphore(value: 1)
    request(Campaigns.GetCampaignsIdContent.Request(fields: nil, excludeFields: nil, campaignId: campaignID)) { response in
      let apiResult = Result(response: response)
      result = apiResult.map(\.archiveHtml).mapError { $0 as Error }.unwrap(orError: ImportError.missingHTMLForCampaignID(campaignID))
      semaphore.signal()
    }
    semaphore.wait()
    return try result.get()
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
