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
              .img(.src("/media/brightdigit-name.svg"), .alt("BrightDigit"))
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
                .src("/media/list.svg"),
                .alt("Mobile Menu")
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

public extension Node where Context == HTML.HeadContext {
  static func meta(name: String, content: String) -> Node<HTML.HeadContext> {
    .meta(
      .attribute(named: "name", value: name),
      .attribute(named: "content", value: content)
    )
  }

  static func meta(property: String, content: String) -> Node<HTML.HeadContext> {
    .meta(
      .attribute(named: "property", value: property),
      .attribute(named: "content", value: content)
    )
  }
}

public extension Node where Context == HTML.DocumentContext {
  static func makeHead(forPage page: PageContent, item _: Item<BrightDigitSite>? = nil) -> Node {
    .head(
      .title(page.headTitle),
      .meta(name: "description", content: page.description),
      .meta(
        .charset(.utf8)
      ),
      .unwrap(page.redirectURL, { url in
        .meta(
          .attribute(named: "http-equiv", value: "refresh"),
          .attribute(named: "content", value: "0; url=\(url)")
        )
      }, else: .meta(name: "robots", content: "index,follow")),
      .meta(name: "twitter:card", content: "summary"),
      .meta(name: "twitter:site", content: "@brightdigit"),
      .meta(name: "twitter:creator", content: "@leogdion"),
      .meta(name: "twitter:title", content: page.socialTitle),
      .meta(name: "twitter:description", content: page.description),
      .meta(name: "twitter:image", content: page.socialImageURL.absoluteString),
      .meta(property: "og:url", content: page.absoluteURL.absoluteString),
      .meta(property: "og:title", content: page.socialTitle),
      .meta(property: "og:description", content: page.description),
      .meta(property: "og:image", content: page.socialImageURL.absoluteString),

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

      .unwrap(page.canonicalURL) { canonicalURL in
        .link(.rel(.canonical), .href(canonicalURL))
      },

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
          .footerItem(href: "http://twitter.com/brightdigit", flatIcon: "twitter"),
          .footerItem(href: "http://github.com/brightdigit", flatIcon: "github"),
          .footerItem(href: "https://www.empowerapps.show", flatIcon: "podcast"),
          .footerItem(href: "http://youtube.com/c/BrightdigitLLC", flatIcon: "youtube"),
          .footerItem(href: "https://us12.campaign-archive.com/home/?u=cb3bba007ed171091f55c47f0&id=584d0d5c40", flatIcon: "newsletter"),
          .footerItem(href: "/feed.rss", flatIcon: "rss")
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
        .ariaLabel(flatIcon.capitalized),
        .href(href),
        .i(.class("flaticon-\(flatIcon)"))
      )
    )
  }
}
