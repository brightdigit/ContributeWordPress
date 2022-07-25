import Foundation
import Plot
import Publish
import PublishType

struct PostItem<PostableType: Postable>: SectionItem {
  typealias WebsiteType = BrightDigitSite
  static var sectionH1: String? {
    PostableType.sectionH1
  }

  static var sectionDescription: String {
    PostableType.sectionDescription
  }

  static var sectionTitle: String {
    PostableType.sectionTitle
  }

  let slug: String
  let description: String
  let featuredImageURL: URL
  let title: String
  let publishedDate: Date
  let source: Item<BrightDigitSite>
  let site: BrightDigitSite
  let subscriptionCTA: String?

  let isFeatured: Bool

  var featuredItemContent: Node<HTML.BodyContext> {
    .header(
      .section(
        .class("hero"),
        .section(
          .class("featured"),
          .header(
            .img(.src(featuredImageURL))
          ),
          .main(
            .header(
              .a(
                .href(source.path),
                .h2(.text(title))
              )
            ),
            .main(
              .text(description)
            ),
            .footer(
              " published on ",
              .span(
                .class("published-date"),
                .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
              )
            )
          )
        )
      )
    )
  }

  var sectionItemContent: [Node<HTML.BodyContext>] {
    [
      .id("post-\(slug)"),
      .header(
        .img(.src(featuredImageURL)),
        .a(
          .href(source.path),
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

  var pageTitle: String {
    title
  }

  var pageBodyID: String? {
    nil
  }

  var absoluteURL: URL {
    source.absoluteURL(forSite: site)
  }

  func shareListItem(for share: SocialShare) -> Node<HTML.ListContext> {
    .li(
      .a(
        .href(share.shareURL(for: self)),
        .target(.blank),
        .span(
          .class("action"),
          .text(share.actionText)
        ),
        .span(
          .class("name"),
          .text(share.nameText)
        ),
        .i(.class("flaticon-\(share.flaticonName)"))
      )
    )
  }

  var pageHeader: Node<HTML.BodyContext> {
    .header(
      .header(
        .img(.src(featuredImageURL)),
        .h1(.text(title))
      ),
      .footer(
        .ol(
          .forEach(SocialShares.shares, shareListItem(for:))
        ),
        .div(
          .class("readtime"),
          .text("\(source.readingTime.minutes) mins")
        )
      )
    )
  }

  var pageFooter: Node<HTML.BodyContext> {
    .footer(
      .ol(
        .forEach(SocialShares.shares, shareListItem(for:))
      ),
      .main(
        .main(
          .unwrap(subscriptionCTA) {
            .h2(.text($0))
          },
          .h3("The BrightDigit newsletter gives you regular helpful tips and advice right to your inbox!"),
          .p(
            .markdown(
              "A couple of times a month, I publish a [newsletter](/newsletters), with news, updates, and other content related to Apple and iOS. I try to help people better understand how to succeed with iOS apps, and keep you informed about what’s coming up on the horizon for the industry."
            )
          )
        ),

        .form(
          .attribute(named: "name", value: "subscribers"),
          .method(.post),
          .attribute(named: "data-netlify", value: "true"),
          .div(
            .div(
              .input(.type(.email), .name("email"), .placeholder("leo@brightdigit.com")),
              .label("Email")
            )
          ),
          .div(
            .div(
              .input(.type(.hidden), .name("source"), .value(source.path.string)),
              .button(.type(.submit), .text("Sign me up!"))
            )
          )
        )
      )
    )
  }

  var pageMainContent: [Node<HTML.BodyContext>] {
    [
      pageHeader,
      .main(.contentBody(source.body)),
      pageFooter
    ]
  }

  var redirectURL: URL? {
    nil
  }

  init(item: Item<BrightDigitSite>, site: BrightDigitSite) throws {
    source = item
    self.site = site
    let featuredImageURL = item.featuredImageURL
    let isFeatured = item.metadata.featured ?? false

    subscriptionCTA = item.metadata.subscriptionCTA
    slug = item.path.string
    title = item.title
    description = item.description
    self.featuredImageURL = featuredImageURL
    publishedDate = item.metadata.date
    self.isFeatured = isFeatured
  }
}
