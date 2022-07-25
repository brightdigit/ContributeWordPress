import Plot

extension ListItem {
  init(forPressCoverage pressCoverage: Product.PressCoverage) {
    self.init {
      Link(url: pressCoverage.url) {
        Element(name: "figure") {
          Element(name: "blockquote") {
            Paragraph(Text(pressCoverage.quote))
          }.attribute(named: "cite", value: pressCoverage.url.absoluteString)
          Element(name: "figcaption") {
            Span(pressCoverage.source).class("name")
          }
          Element(name: "cite") {
            Text(PiHTMLFactory.itemFormatter.string(from: pressCoverage.date))
          }
        }
      }.linkTarget(.blank)
    }
  }

  init(forProduct product: Product) {
    self.init {
      SectionElement {
        Header {
          Link(url: product.productURL) {
            Image(url: product.logo, description: "\(product.title) logo")
            H2 {
              Text(product.title)
            }
          }.linkTarget(.blank)
          List {
            ListItem {
              Link("Product Page", url: product.productURL)
              if let githubURL = product.githubURL {
                ListItem {
                  Link(url: githubURL) {
                    Icon(className: "flaticon-github")
                    Text("GitHub")
                  }.linkTarget(.blank)
                }
              }
            }
          }.class("links")

          List(product.platforms) { platform in
            ListItem(platform)
          }.class("platforms")
        }
        Element(name: "main") {
          Node.markdown(product.description)
          List(product.screenshots) { screenshotURL in
            ListItem {
              Image(screenshotURL)
            }

          }.class("screenshots \(product.style.rawValue)")
          List(product.pressCoverage, content: ListItem.init(forPressCoverage:)).class("press-coverage")
        }
        Footer {
          SectionElement {
            H4(Text("Technologies"))
            List(product.technologies) { tech in
              ListItem(Text(tech))
            }
          }
        }
      }.environmentValue(.ordered, key: .listStyle)
    }
  }
}
