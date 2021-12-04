import Foundation
import LoremSwiftum
import Plot
import Publish

public extension Node where Context == HTML.ListContext {
  /// Add an `<li>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  static func li(for name: String, at path: String? = nil) -> Node {
    .li(
      .a(
        .href("/" + (path ?? name.lowercased())),
        .text(name.capitalized)
      )
    )
  }

  // MARK: - LoremIpsum

  static func loremIpsumTestimonial() -> Node {
    .li(
      .element(named: "figure", nodes: [.blockquote(
        .p(
          .text(Lorem.sentences(2))
        )
      ), .element(named: "figcaption", nodes: [
        .text("-"),
        .text(Lorem.fullName),
        .text(", "),
        .element(named: "cite", nodes: [.text(Lorem.title)])
      ])])
    )
  }

  static func loremIpsumArticle() -> Node {
    .li(
      .header(
        .img(.src("http://placeimg.com/200/150/tech/\(UUID().uuidString)")),
        .h3(.text(Lorem.title)),
        .ol(
          .li(.text(Lorem.word))
        ),
        .ol(
          .group(
            (1 ... Int.random(in: 1 ... 3)).map { _ in Lorem.word }.map { .text($0) }.map { .li($0) }
          )
        )
      ),
      .main(
        .p(.text(Lorem.sentences(2)))
      ),
      .footer(
        .div(
          .class("publishedAt"),
          .text("Feb 2, 2021") // Date(timeIntervalSinceNow: .random(in: 1.365) * 86400.0)
        ),
        .div(
          .class("readTime"),
          .text("4 mins read") // Date(timeIntervalSinceNow: .random(in: 1.365) * 86400.0)
        )
      )
    )
  }
}

// MARK: - ItemList

public extension Node where Context == HTML.BodyContext {
  static func itemList(for items: [Item<BrightDigit>], on _: BrightDigit) -> Node {
    .ul(
      .class("item-list"),
      .forEach(items) { item in
        .li(.article(
          .img(.src(item.metadata.featuredImage ?? "http://placeimg.com/800/450/tech/\(UUID().uuidString)")),
          .h2(.a(
            .href(item.path),
            .text(item.title)
          )),
          .ol(
            .group(
              (1 ... Int.random(in: 1 ... 3)).map { _ in Lorem.word }.map { .text($0) }.map { .li(.a($0, .href("/"))) }
            )
          ),
          .p(.text(item.description)),
          .footer(
            .div(
              .class("publishedAt"),
              .text("Feb 2, 2021") // Date(timeIntervalSinceNow: .random(in: 1.365) * 86400.0)
            ),
            .div(
              .class("readTime"),
              .text("4 mins read") // Date(timeIntervalSinceNow: .random(in: 1.365) * 86400.0)
            )
          )
        ))
      }
    )
  }

  // MARK: - HeaderNav

  /// Add an `<li>` HTML element within the current context.
  /// - parameter nodes: The element's attributes and child elements.
  static func headerNav() -> Node {
    .header(
      .nav(
        .ol(
          .class("logo"),
          .li(
            .a(
              .href("/"),
              .img(.src("/media/brightdigit-name.svg"))
            )
          )
        ),
        .ol(
          .class("menu"),
          .li(for: "Services"),
          .li(for: "Products"),
          .li(for: "Articles"),
          .li(for: "Development")
        ),
        .ol(
          .class("menu"),
          .li(for: "Podcast"),
          .li(for: "Newsletters"),
          .li(for: "Sponsorship"),
          .li(for: "About")
        ),
        .ol(
          .class("more"),
          .li(for: "Menu", at: "#menu")
        )
      )
    )
  }
}

// MARK: - Testimonials

public extension Node where Context == HTML.BodyContext {
  static func sectionForTestimonials() -> Node {
    .section(
      .id("testimonials"),
      .header(
        .h2("Testimonials")
      ),
      .ol(
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial()
      )
    )
  }

  static func sectionForHero() -> Node {
    .section(
      .class("hero"),
      .main(
        .text("Understanding complex large projects with the thorough knowledge of iOS app development")
      )
    )
  }

  // MARK: - sectionForServices

  static func sectionForServices() -> Node {
    .section(
      .class("services"),
      .header(
        .h2("Services")
      ),
      .ol(
        .li(
          .header(
            .h3(.text("iPhone and iPad")),
            .img(.src("/media/services/003-iphone.svg"))
          ),
          .main(
            .p(.text(Lorem.sentences(2)))
          )
        ),
        .li(
          .header(
            .h3(.text("Apple Watch")),
            .img(.src("/media/services/002-smartwatch-app.svg"))
          ),
          .main(
            .p(.text(Lorem.sentences(2)))
          )
        ),
        .li(
          .header(
            .h3(.text("Swift")),
            .img(.src("/media/services/001-swift.svg"))
          ),
          .main(
            .p(.text(Lorem.sentences(2)))
          )
        ),
        .li(
          .header(
            .h3(.text("Cloud and Server")),
            .img(.src("/media/services/004-cloud.svg"))
          ),
          .main(
            .p(.text(Lorem.sentences(2)))
          )
        )
      )
    )
  }
}

public extension Node where Context == HTML.BodyContext {
  static func year(fromDate date: Date = Date()) -> Self {
    text(CompanyHTMLFactory.yearFormatter.string(from: date))
  }
}

public protocol PageInfo {
  static var title: String { get set }
}

public struct MockPage: PageInfo {
  public static var title = "titleHere"
}

public extension Node where Context == HTML.DocumentContext {
  static func makeHead(forPage _: PageInfo) -> Node {
    .head(
      .meta(
        .charset(.utf8)
      ),
      .meta(
        .name("viewport"),
        .content("width=device-width, initial-scale=1.0")
      ),
      .link(
        .rel(.stylesheet),
        .href("/css/styles.css")
      )
    )
  }
}

public extension Node where Context == HTML.BodyContext {
  static func makeFooter() -> Node {
    .footer(
      .footer(
        .header(
          .a(
            .href("/"),
            .img(
              .class("logo"),
              .alt("BrightDigit"),
              .src("/media/brightdigit-name.svg")
            )
          )
        ),
        .ol(
          .class("social"),
          .makeIcon(href: "/", flatIcon: "twitter"),
          .makeIcon(href: "/", flatIcon: "github"),
          .makeIcon(href: "/", flatIcon: "podcast"),
          .makeIcon(href: "/", flatIcon: "youtube"),
          .makeIcon(href: "/", flatIcon: "newsletter"),
          .makeIcon(href: "/", flatIcon: "rss")
        ),
        .footer(
          .div(
            .class("address"),
            .text("5859 W Saginaw #182 Lansing MI 48917")
          ),
          .div(
            .class("copyright"),
            .text("© Bright Digit, LLC "),
            .year()
          )
        )
      )
    )
  }
}

public extension Node where Context == HTML.ListContext {
  static func makeIcon(href: String, flatIcon: String) -> Node {
    .li(
      .a(
        .href(href),
        .i(.class("flaticon-\(flatIcon)"))
      )
    )
  }
}

struct CompanyHTMLFactory: HTMLFactory {
  static let yearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
  }()

  // MARK: - makeIndexHTML

  func makeIndexHTML(for _: Index, context _: PublishingContext<BrightDigit>) throws -> HTML {
    HTML(
      .makeHead(forPage: MockPage()),
      .body(
        .headerNav(),
        .main(
          .sectionForHero(),
          .sectionForServices(),
          .sectionForTestimonials(),
          .section(
            .id("articles"),
            .header(
              .h2("Latest Articles")
            ),
            .ol(
              .loremIpsumArticle(),
              .loremIpsumArticle(),
              .loremIpsumArticle(),
              .loremIpsumArticle(),
              .loremIpsumArticle(),
              .loremIpsumArticle(),
              .loremIpsumArticle(),
              .loremIpsumArticle()
            )
          )
        ),
        .makeFooter()
      )
    )
  }

  // MARK: - makeSectionHTML

  func makeSectionHTML(for section: Section<BrightDigit>, context _: PublishingContext<BrightDigit>) throws -> HTML {
    switch section.id {
    default:
      return HTML(
        .makeHead(forPage: MockPage()),
        .body(
          .headerNav(),
          .p("This is a section"),
          .makeFooter()
        )
      )
    }
  }

  // MARK: - makeItemHTML

  func makeItemHTML(for item: Item<BrightDigit>, context _: PublishingContext<BrightDigit>) throws -> HTML {
    HTML(
      .makeHead(forPage: MockPage()),
      .body(
        .headerNav(),
        .main(
          .article(
            .div(
              .class("content"),

              .contentBody(item.body)
            ),
            .span("Tagged with: ")
            // .tagList(for: item, on: context.site)
          )
        ),
        .makeFooter()
      )
    )
  }

  // MARK: - makePageHTML

  func makePageHTML(for page: Page, context _: PublishingContext<BrightDigit>) throws -> HTML {
    switch page.path {
    case "services":
      return HTML(
        .makeHead(forPage: MockPage()),
        .body(
          .id("services"),
          .headerNav(),
          .makeServicesSectionBody(),
          .makeFooter()
        )
      )
    default:
      return HTML(
        .makeHead(forPage: MockPage()),
        .body(
          .text("this is a default page")
        )
      )
    }
  }

  // MARK: - makeTagListHTML

  func makeTagListHTML(for _: TagListPage, context _: PublishingContext<BrightDigit>) throws -> HTML? {
    HTML(
      .makeHead(forPage: MockPage()),
      .body(
        .text("makeTagListHTML")
      )
    )
  }

  // MARK: - makeTagDetailsHTML

  func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<BrightDigit>) throws -> HTML? {
    HTML(
      .makeHead(forPage: MockPage()),
      .body(
        .text("makeTagDetailsHTML")
      )
    )
  }

  typealias Site = BrightDigit
}

// MARK: - Theme

extension Theme where Site == BrightDigit {
  static var company: Self {
    Theme(htmlFactory: CompanyHTMLFactory())
  }
}
