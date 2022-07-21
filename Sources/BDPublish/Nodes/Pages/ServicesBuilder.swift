import BDSite
import Plot
import Publish

struct ServicesBuilder: PageBuilder {
  let imagePath: Path = "/media/services/new2-12.png"

  let description: String = "Is your app making customers and driving sales? We help you create, rebuild and port apps to excite customers and boost your business."

  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    Node.servicesBody()
  }

  var bodyClasses: [String] { [] }
}

public extension Node where Context == HTML.BodyContext {
  // MARK: - makeHeroSection

  static func makeHeroSection() -> Node {
    .header(
      .section(
        .p("We work with ", .i("companies and agencies"), " that want Swift-based apps that are:"),
        .h1("Intuitive.", .br(), "Effective.", .br(), "Well-Designed.")
      )
    )
  }

  static func makeServicesBox(classStr: String, id: String, bigImageSrc: String, bigImageAlt: String, smallImageSrc: String, smallImageAlt: String, title: String, paragraph: String) -> Node {
    makeServicesBox(classStr: classStr, id: id, bigImageSrc: bigImageSrc, bigImageAlt: bigImageAlt, smallImageSrc: smallImageSrc, smallImageAlt: smallImageAlt, title: title, paragraphs: [paragraph])
  }

  static func makeServicesBox(classStr: String, id: String, bigImageSrc: String, bigImageAlt: String, smallImageSrc: String, smallImageAlt: String, title: String, paragraphs: [String]) -> Node {
    .section(
      .class(classStr),
      .id(id),
      .header(
        .img(
          .class("rounded-lg"),
          .src(bigImageSrc),
          .alt(bigImageAlt)
        )
      ),
      .main(
        .header(
          .img(.src(smallImageSrc), .alt(smallImageAlt)),
          .h2("\(title)")
        ),
        .forEach(paragraphs) { paragraph in
          .p(.text(paragraph))
        },
        .footer(
          .a(
            .class("button"),
            .href("/contact-us"),
            .text("Contact Us")
          )
        )
      )
    )
  }

  static func makeCTABox() -> Node {
    .section(
      .class("products-cta"),
      .main(
        .header(
          .h2(
            "Check out some of the ", .b("work"), " we've done..."
          )
        ),
        .footer(
          .a(
            .class("button"),
            .href("/products"),
            .text("Our Work")
          )
        )
      )
    )
  }
}

public extension Node where Context == HTML.BodyContext {
  static func servicesBody() -> [Node] {
    [
      .makeHeroSection(),

      .makeServicesBox(
        classStr: "service",
        id: "iPhone-service",
        bigImageSrc: "/media/services/new2-12.png",
        bigImageAlt: "Building a Brand New App",
        smallImageSrc: "/media/services/003-iphone.svg",
        smallImageAlt: "iPhone",
        title: "New App Development",
        paragraph: Strings.Services.iOSDevelopment
      ),

      .makeServicesBox(classStr: "service",
                       id: "swift-service",
                       bigImageSrc: "/media/services/12-agustus-outline-02.png",
                       bigImageAlt: "Upgrading an Existing App",
                       smallImageSrc: "/media/services/001-swift.svg",
                       smallImageAlt: "Swift Logo",
                       title: "Upgrade Your Existing App",
                       paragraph: Strings.Services.consulting),

      .makeServicesBox(classStr: "service",
                       id: "apple-service",
                       bigImageSrc: "/media/services/mar6-outline-07.png",
                       bigImageAlt: "Porting an app over",
                       smallImageSrc: "/media/services/002-smartwatch-app.svg",
                       smallImageAlt: "Apple Watch",
                       title: "Port Your App to Apple Platforms",
                       paragraph: Strings.Services.appleDevelopment),

      .makeCTABox()
    ]
  }
}
