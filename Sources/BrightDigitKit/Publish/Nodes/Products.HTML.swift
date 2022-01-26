import Plot

extension Product.PressCoverage {
  static func listItem(_ pressCoverage: Self) -> Node<HTML.ListContext> {
    .li(
      .a(.href(pressCoverage.url), .target(.blank),
         .element(named: "figure", nodes: [
           .blockquote(
             .attribute(named: "cite", value: pressCoverage.url.absoluteString),
             .p(.text(pressCoverage.quote))
           ),
           .element(named: "figcaption", nodes: [
             .span(
               .class("name"),
               .text(pressCoverage.source)
             ),
             .element(named: "cite", text: PiHTMLFactory.itemFormatter.string(from: pressCoverage.date))
           ])
         ]))
    )
  }
}

extension Product {
  static func listItem(_ product: Product) -> Node<HTML.ListContext> {
    .li(
      .section(
        .header(
          .a(
            .href(product.productURL),
            .target(.blank),
            .img(.src(product.logo)),
            .h3(.text(product.title))
          ),
          .ol(
            .class("links"),
            .li(
              .a(
                .href(product.productURL),
                .target(.blank),
                .text("Product Page")
              )
            ),
            .unwrap(product.githubURL) { githubURL in
              .li(
                .a(
                  .href(githubURL),
                  .target(.blank),
                  .i(.class("flaticon-github")),
                  .text("GitHub")
                )
              )
            }
          ),
          .ol(
            .class("platforms"),
            .forEach(product.platforms) { platform in
              .li(.text(platform))
            }
          )
        ),
        .main(
          .p(.text(product.description)),
          .ol(
            .class("screenshots \(product.style.rawValue)"),
            .forEach(product.screenshots) { screenshotURL in
              .li(
                .img(.src(screenshotURL))
              )
            }
          ),
          .ol(
            .class("press-coverage"),
            .forEach(product.pressCoverage, PressCoverage.listItem)
          )
        ),
        .footer(
          .section(
            .h4(.text("Technologies")),
            .ol(
              .forEach(product.technologies) { tech in
                .li(.text(tech))
              }
            )
          )
        )
      )
    )
  }
}
