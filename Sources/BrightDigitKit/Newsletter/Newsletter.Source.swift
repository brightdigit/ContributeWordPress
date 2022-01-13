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
      previewText = campaign.previewText
      sendTime = campaign.sendTime
      self.html = html
      self.markdown = markdown
    }

    let slug: String
    let issueNo: Int
    let campaignID: String
    let longArchiveURL: URL
    let featuredImageURL: URL?
    let title: String
    let subjectLine: String
    let previewText: String?
    let sendTime: Date
    let html: String
    let markdown: String
  }
}
