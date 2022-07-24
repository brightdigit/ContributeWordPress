import Plot

struct ServiceBox: Component {
  let id: String
  let bigImage: Image
  let smallImage: Image
  let title: String
  let text: String

  var body: Component {
    Element(name: "section") {
      Header {
        bigImage.class("rounded-lg")
      }
      Element(name: "main") {
        Header {
          smallImage
          H2(title)
        }
        Paragraph {
          Text(self.text)
        }
        Footer {
          Link("Contact Us", url: "/contact-us").class("button")
        }
      }
    }.class("service").id(id)
  }
}
