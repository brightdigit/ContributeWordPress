import Foundation

public struct MailchimpCampaignRequest {
  public init(listID: String) {
    self.listID = listID
  }

  let listID: String
}
