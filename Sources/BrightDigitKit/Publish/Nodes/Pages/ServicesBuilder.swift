import Plot
import Publish

struct ServicesBuilder: PageBuilder {
  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    Node.servicesBody()
  }
}

public extension Node where Context == HTML.BodyContext {
  // MARK: - makeHeroSection

  static func makeHeroSection() -> Node {
    .header(
      .section(
        .p("We work with ", .i("companies and agencies"), " that want Swift-based apps that are"),
        .h1("Intuitive.", .br(), "Effective.", .br(), "Well-Designed.")
      )
    )
  }

  static func makeServicesBox(classStr: String, id: String, bigImageSrc: String, smallImageSrc: String, title: String, paragraph: String) -> Node {
    makeServicesBox(classStr: classStr, id: id, bigImageSrc: bigImageSrc, smallImageSrc: smallImageSrc, title: title, paragraphs: [paragraph])
  }

  static func makeServicesBox(classStr: String, id: String, bigImageSrc: String, smallImageSrc: String, title: String, paragraphs: [String]) -> Node {
    .section(
      .class(classStr),
      .id(id),
      .header(
        .img(
          .class("rounded-lg"),
          .src(bigImageSrc)
        )
      ),
      .main(
        .header(
          .img(.src(smallImageSrc)),
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
        smallImageSrc: "/media/services/003-iphone.svg",
        title: "New App Development",
        paragraph: Strings.Services.iOSDevelopment
      ),

      .makeServicesBox(classStr: "service",
                       id: "swift-service",
                       bigImageSrc: "/media/services/12-agustus-outline-02.png",
                       smallImageSrc: "/media/services/001-swift.svg",
                       title: "Upgrade Your Existing App",
                       paragraph: Strings.Services.consulting),

      .makeServicesBox(classStr: "service",
                       id: "apple-service",
                       bigImageSrc: "/media/services/mar6-outline-07.png",
                       smallImageSrc: "/media/services/002-smartwatch-app.svg",
                       title: "Port Your App to Apple Platforms",
                       paragraph: Strings.Services.appleDevelopment),

      .makeCTABox()
    ]
  }
}
