import Foundation
import Plot
import Publish

struct TutorialItem: SectionItem {
  let slug: String
  let description: String
  let featuredImageURL: URL
  let title: String
  let publishedDate: Date

  let isFeatured: Bool

  var featuredItemContent: [Node<HTML.BodyContext>] {
    [
      .header(
        .img(.src(featuredImageURL)),
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
      .id("post-\(slug)"),
      .header(
        .img(.src(featuredImageURL)),
        .a(
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
    let isFeatured = item.metadata.featured ?? false

    guard let featuredImageURL = featuredImageURL else {
      throw PiError.missingField(MissingFields.TutorialField.featuredImageURL, item)
    }

    slug = item.path.string
    title = item.title
    description = item.description
    self.featuredImageURL = featuredImageURL
    publishedDate = item.metadata.date
    self.isFeatured = isFeatured
  }
}
