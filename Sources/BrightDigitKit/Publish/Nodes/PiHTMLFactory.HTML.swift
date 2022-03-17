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

// MARK: - makeHead

public extension Node where Context == HTML.DocumentContext {
  static func makeHead(forPage page: PageContent, item: Item<BrightDigitSite>? = nil) -> Node {
    .head(
      .meta(
        .charset(.utf8)
      ),
      .newsletterRedirect(forPage: page, item: item),
      .title(page.title),
      .meta(
        .name("viewport"),
        .content("width=device-width, initial-scale=1.0")
      ),

      .link(.rel(.icon), .href("/favicon.ico"), .sizes("any"), .type("image/svg+xml")),
      .link(.rel(.icon), .href("/favicon.svg"), .type("image/svg+xml")),

      .link(.rel(.manifest), .href("/site.webmanifest?v=2022")),
      .link(.id("mask-icon"), .rel(.maskIcon), .href("/safari-pinned-tab.svg?v=2022"), .color("#000000")),
      .link(.id("apple-dark-mode-icon"), .rel(.alternate), .href("/dark-mode-mask.svg?v=2022")),
      .link(.id("apple-light-mode-icon"), .rel(.alternate), .href("/safari-pinned-tab.svg?v=2022")),

//      <meta name="apple-mobile-web-app-title" content="BrightDigit">
//      <meta name="application-name" content="BrightDigit">

      .script(
        .src("/js/main.js")
      ),
      .script(
        .async(),
        .src("https://www.googletagmanager.com/gtag/js?id=G-K3MSJ0CTMJ")
      )
    )
  }
}

public extension Node where Context == HTML.HeadContext {
  static func newsletterRedirect(forPage _: PageContent, item: Item<BrightDigitSite>? = nil) -> Node {
    if item?.metadata.longArchiveURL != nil {
      return .meta(
        .attribute(named: "http-equiv", value: "refresh"),
        .attribute(named: "content", value: "0; url=\(item!.metadata.longArchiveURL!)")
      )
    } else {
      return .empty
    }
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
