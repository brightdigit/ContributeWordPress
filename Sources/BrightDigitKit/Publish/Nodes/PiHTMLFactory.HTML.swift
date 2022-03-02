import Foundation
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
}

// MARK: - ItemList

public extension Node where Context == HTML.BodyContext {
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
          .li(for: "Tutorials")
        ),
        .ol(
          .class("menu"),
          .li(for: "Podcast", at: "episodes"),
          .li(for: "Newsletters"),
          .li(
            .a(.href("/about-us"),
               .text("About"))
          )
        ),
        .ol(
          .class("menu"),
          .li(
            .a(.href("/contact-us"),
               .text("Contact Us"))
          )
        ),
        .ol(
          .class("more"),
          .li(
            .button(
              .id("menu"),
              .img(
                .src("/media/list.svg")
              )
            )
          )
        )
      )
    )
  }
}

public extension Node where Context == HTML.BodyContext {
  static func year(fromDate date: Date = Date()) -> Self {
    text(PiHTMLFactory.yearFormatter.string(from: date))
  }
}

public extension Node where Context == HTML.DocumentContext {
  static func makeHead(forPage page: PageContent) -> Node {
    .head(
      .meta(
        .charset(.utf8)
      ),
      .title(page.title),
      .meta(
        .name("viewport"),
        .content("width=device-width, initial-scale=1.0")
      ),
      .script(
        .src("/js/main.js")
      )
    )
  }
}

// MARK: - makeFooter

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
          .footerItem(href: "/", flatIcon: "twitter"),
          .footerItem(href: "/", flatIcon: "github"),
          .footerItem(href: "/", flatIcon: "podcast"),
          .footerItem(href: "/", flatIcon: "youtube"),
          .footerItem(href: "/", flatIcon: "newsletter"),
          .footerItem(href: "/", flatIcon: "rss")
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
  static func footerItem(href: String, flatIcon: String) -> Node {
    .li(
      .a(
        .href(href),
        .i(.class("flaticon-\(flatIcon)"))
      )
    )
  }
}
