import Foundation
import Plot
import Publish

struct NewsletterItem: SectionItem {
  let description: String
  let issueNo: Int
  let featuredImageURL: URL
  let archiveURL: URL
  let title: String
  let publishedDate: Date

  let isFeatured: Bool

  var featuredItemContent: [Node<HTML.BodyContext>] {
    [
      .header(
        .img(.src(featuredImageURL)),
        .a(
          .href(archiveURL),
          .h2(.text(title))
        )
      ),
      .main(
        .text(description)
      )
    ]
  }

  var itemContent: [Node<HTML.BodyContext>] {
    [
      .id("issue-\(issueNo)"),
      .header(
        .img(.src(featuredImageURL)),
        .a(
          .href(archiveURL),
          .h2(.text(title))
        )
      ),
      .main(
        .text(description)
      ),
      .footer(
        .a(
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        )
      )
    ]
  }

  init(item: Item<BrightDigitSite>) throws {
    let featuredImageURL = item.metadata.featuredImage.flatMap(URL.init(string:))
    let archiveURL = item.metadata.longArchiveURL.flatMap(URL.init(string:))
    let isFeatured = item.metadata.featured ?? false
    let issueNo = item.metadata.issueNo.flatMap(Int.init)

    guard let featuredImageURL = featuredImageURL else {
      throw PiError.missingField(MissingFields.NewsletterField.featuredImageURL, item)
    }

    guard let archiveURL = archiveURL else {
      throw PiError.missingField(MissingFields.NewsletterField.archiveURL, item)
    }

    guard let issueNo = issueNo else {
      throw PiError.missingField(MissingFields.NewsletterField.issueNo, item)
    }

    title = item.title
    description = item.description
    self.featuredImageURL = featuredImageURL
    publishedDate = item.metadata.date
    self.issueNo = issueNo
    self.archiveURL = archiveURL
    self.isFeatured = isFeatured
  }
}
