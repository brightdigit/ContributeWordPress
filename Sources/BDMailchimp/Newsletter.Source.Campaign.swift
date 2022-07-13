import BDContent
import Foundation
import Prch

public extension Newsletter.Source {
  struct Campaign {
    public let slug: String
    public let issueNo: Int
    public let campaignID: String
    public let longArchiveURL: URL
    public let featuredImageURL: URL?
    public let title: String
    public let subjectLine: String
    public let previewText: String?
    public let sendTime: Date
  }
}

public extension Newsletter.Source.Campaign {
  init?(campaign: MailchimpCampaign) throws {
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

    self.init(slug: slug, issueNo: issueNo, campaignID: campaignID, longArchiveURL: longArchiveURL, featuredImageURL: featuredImageURL, title: title, subjectLine: subjectLine, previewText: previewText, sendTime: sendTime)
  }
}
