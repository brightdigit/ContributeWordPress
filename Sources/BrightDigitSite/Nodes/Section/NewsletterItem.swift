import Foundation
import Plot
import Publish
import PublishType

struct NewsletterItem: SectionItem {
  typealias WebsiteType = BrightDigitSite

  static let sectionH1: String? = nil
  static let sectionTitle: String = "Newsletters"
  static let sectionDescription: String = "Subscribe to the BrightDigit newsletter now and get  helpful tips and advice right to your inbox!"

  let description: String
  let issueNo: Int
  let featuredImageURL: URL
  let archiveURL: URL
  let title: String
  let publishedDate: Date
  let source: Item<BrightDigitSite>

  let isFeatured: Bool

  var formNode: Node<HTML.BodyContext> {
    .form(
      .attribute(named: "name", value: "subscribers"),
      .method(.post),
      .attribute(named: "data-netlify", value: "true"),
      .div(
        .div(
          .input(.type(.text),
                 .placeholder("leo@brightdigit.com"),
                 .name("email")),
          .label("Email")
        )
      ),
      .div(
        .div(
          .button("Sign me up!", .type(.submit))
        )
      ),
      .div(
        .class("message"),
        .div(
          .h3("Be the first to know:"),
          .ol(
            .li("When we publish", .b(" new content "), "on building better apps on our blog or podcast."),
            .li("Details about", .b(" upcoming events and conferences "), "Leo is speaking at."),
            .li("About the", .b(" latest developments "), "in the world of Swift and Apple software, and how they can help you.")
          )
        )
      )
    )
  }

  var featuredItemContent: Node<HTML.BodyContext> {
    .header(
      .section(
        .h1("Don't Let Your App", .em("Fall Behind")),
        .p("\(Strings.Newsletter.featuredParagraph)")
      ),
      .section(
        .class("hero"),

        formNode,

        .section(
          .class("featured"),
          .header(
            .h3("Featured issue"),
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
            .text("published on"),
            .span(
              .class("published-date"),
              .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
            )
          )
        )
      )
    )
  }

  var sectionItemContent: [Node<HTML.BodyContext>] {
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
        .text("published on"),
        .span(
          .class("published-date"),
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        )
      )
    ]
  }

  var pageTitle: String {
    title
  }

  var pageBodyID: String? {
    nil
  }

  var pageMainContent: [Node<HTML.BodyContext>] {
    [.contentBody(source.body)]
  }

  var redirectURL: URL? {
    archiveURL
  }

  init(item: Item<BrightDigitSite>, site _: BrightDigitSite) throws {
    source = item
    let featuredImageURL = item.featuredImageURL
    let archiveURL = item.metadata.longArchiveURL.flatMap(URL.init(string:))
    let isFeatured = item.metadata.featured ?? false
    let issueNo = item.metadata.issueNo.flatMap(Int.init)

    guard let archiveURL = archiveURL else {
      throw PublishTypeError.missingField(MissingFields.NewsletterField.archiveURL, item)
    }

    guard let issueNo = issueNo else {
      throw PublishTypeError.missingField(MissingFields.NewsletterField.issueNo, item)
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
