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

public extension Node where Context == HTML.BodyContext {
  static func itemList<T: Website>(for items: [Item<T>], on _: T) -> Node {
    .ul(
      .class("item-list"),
      .forEach(items) { item in
        .li(.article(
          .h1(.a(
            .href(item.path),
            .text(item.title)
          )),
          // .tagList(for: item, on: site),
          .p(.text(item.description))
        ))
      }
    )
  }

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

struct CompanyHTMLFactory: HTMLFactory {
  static let yearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
  }()

  func makeIndexHTML(for _: Index, context _: PublishingContext<BrightDigit>) throws -> HTML {
    HTML(
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
      ),
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

  func makeSectionHTML(for section: Section<BrightDigit>, context: PublishingContext<BrightDigit>) throws -> HTML {
    HTML(
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
      ),
      .body(
        .h1(.text(section.title)),
        .itemList(for: section.items, on: context.site)
      )
    )
  }

  func makeItemHTML(for item: Item<BrightDigit>, context _: PublishingContext<BrightDigit>) throws -> HTML {
    HTML(
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
      ),
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

  func makePageHTML(for _: Page, context _: PublishingContext<BrightDigit>) throws -> HTML {
    HTML(
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
      ),
      .body(
        .text("makePageHTML")
      )
    )
  }

  func makeTagListHTML(for _: TagListPage, context _: PublishingContext<BrightDigit>) throws -> HTML? {
    HTML(
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
      ),
      .body(
        .text("makeTagListHTML")
      )
    )
  }

  func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<BrightDigit>) throws -> HTML? {
    HTML(
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
      ),
      .body(
        .text("makeTagDetailsHTML")
      )
    )
  }

  typealias Site = BrightDigit
}

//
// struct CompanyHTMLFactory : HTMLFactory {
//  func makeIndexHTML(for index: Index,
//                     context: PublishingContext<Site>) throws -> HTML {
//      HTML(
//          .lang(context.site.language),
//          .head(for: index, on: context.site),
//          .body(
//              .header(for: context, selectedSection: nil),
//                  .h1(.text(index.title)),
//                  .p(
//                      .class("description"),
//                      .text(context.site.description)
//                  ),
//                  .h2("Latest content"),
//                  .itemList(
//                      for: context.allItems(
//                          sortedBy: \.date,
//                          order: .descending
//                      ),
//                      on: context.site
//                  ),
//              .footer(for: context.site)
//          )
//      )
//  }
//
//  func makeSectionHTML(for section: Section<Site>,
//                       context: PublishingContext<Site>) throws -> HTML {
//      HTML(
//          .lang(context.site.language),
//          .head(for: section, on: context.site),
//          .body(
//              .header(for: context, selectedSection: section.id),
//
//              .footer(for: context.site)
//          )
//      )
//  }
//
//  func makeItemHTML(for item: Item<Site>,
//                    context: PublishingContext<Site>) throws -> HTML {
//      HTML(
//          .lang(context.site.language),
//          .head(for: item, on: context.site),
//          .body(
//              .class("item-page"),
//              .header(for: context, selectedSection: item.sectionID),
//              .wrapper(
//                  .article(
//                      .div(
//                          .class("content"),
//                          .contentBody(item.body)
//                      ),
//                      .span("Tagged with: "),
//                      .tagList(for: item, on: context.site)
//                  )
//              ),
//              .footer(for: context.site)
//          )
//      )
//  }
//
//  func makePageHTML(for page: Page,
//                    context: PublishingContext<Site>) throws -> HTML {
//      HTML(
//          .lang(context.site.language),
//          .head(for: page, on: context.site),
//          .body(
//              .header(for: context, selectedSection: nil),
//              .wrapper(.contentBody(page.body)),
//              .footer(for: context.site)
//          )
//      )
//  }
//
//  func makeTagListHTML(for page: TagListPage,
//                       context: PublishingContext<Site>) throws -> HTML? {
//      HTML(
//          .lang(context.site.language),
//          .head(for: page, on: context.site),
//          .body(
//              .header(for: context, selectedSection: nil),
//              .wrapper(
//                  .h1("Browse all tags"),
//                  .ul(
//                      .class("all-tags"),
//                      .forEach(page.tags.sorted()) { tag in
//                          .li(
//                              .class("tag"),
//                              .a(
//                                  .href(context.site.path(for: tag)),
//                                  .text(tag.string)
//                              )
//                          )
//                      }
//                  )
//              ),
//              .footer(for: context.site)
//          )
//      )
//  }
//
//  func makeTagDetailsHTML(for page: TagDetailsPage,
//                          context: PublishingContext<Site>) throws -> HTML? {
//      HTML(
//          .lang(context.site.language),
//          .head(for: page, on: context.site),
//          .body(
//              .header(for: context, selectedSection: nil),
//              .wrapper(
//                  .h1(
//                      "Tagged with ",
//                      .span(.class("tag"), .text(page.tag.string))
//                  ),
//                  .a(
//                      .class("browse-all"),
//                      .text("Browse all tags"),
//                      .href(context.site.tagListPath)
//                  ),
//                  .itemList(
//                      for: context.items(
//                          taggedWith: page.tag,
//                          sortedBy: \.date,
//                          order: .descending
//                      ),
//                      on: context.site
//                  )
//              ),
//              .footer(for: context.site)
//          )
//      )
//  }
//
//  typealias Site = BrightDigit
//
//
// }
extension Theme where Site == BrightDigit {
  static var company: Self {
    Theme(htmlFactory: CompanyHTMLFactory())
  }
}
