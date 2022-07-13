import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public extension Newsletter {
  struct Source {
    public init(slug: String, issueNo: Int, campaignID: String, longArchiveURL: URL, featuredImageURL: URL?, title: String, subjectLine: String, previewText: String?, sendTime: Date, html: String, markdown: String) {
      self.slug = slug
      self.issueNo = issueNo
      self.campaignID = campaignID
      self.longArchiveURL = longArchiveURL
      self.featuredImageURL = featuredImageURL
      self.title = title
      self.subjectLine = subjectLine
      self.previewText = previewText
      self.sendTime = sendTime
      self.html = html
      self.markdown = markdown
    }

    public init(campaign: Campaign, html: String, markdown: String) {
      slug = campaign.slug
      issueNo = campaign.issueNo
      campaignID = campaign.campaignID
      longArchiveURL = campaign.longArchiveURL
      featuredImageURL = campaign.featuredImageURL
      title = campaign.title
      subjectLine = campaign.subjectLine
      previewText = campaign.previewText?.dequote().fixUnicodeEscape()
      sendTime = campaign.sendTime
      self.html = html
      self.markdown = markdown
    }

    public let slug: String
    public let issueNo: Int
    public let campaignID: String
    public let longArchiveURL: URL
    public let featuredImageURL: URL?
    public let title: String
    public let subjectLine: String
    public let previewText: String?
    public let sendTime: Date
    public let html: String
    public let markdown: String
  }
}
