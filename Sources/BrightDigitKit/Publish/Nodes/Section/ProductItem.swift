import Foundation
import Plot
import Publish

struct ProductItem: SectionItem {
  let description: String
  let title: String
  let publishedDate: Date
  let isFeatured: Bool

  var featuredItemContent: [Node<HTML.BodyContext>] {
    [
      .header(
        // .img(.src(featuredImageURL)),
        .a(
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
      .id("product"),
      .header(
        // .img(.src(featuredImageURL)),
        .a(
          // .href(archiveURL),
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

    title = item.title
    description = item.description
    publishedDate = item.metadata.date
    self.isFeatured = isFeatured
  }
}
