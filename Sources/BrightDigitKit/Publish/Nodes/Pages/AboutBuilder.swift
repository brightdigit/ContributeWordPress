import Foundation
import LoremSwiftum
import Plot
import Publish

struct AboutBuilder: PageBuilder {
  func main(forLocation _: LocationType, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .aboutHeader(),
      .leftImageWithRightTextNoHeader(imageSrc: "https://via.placeholder.com/1920x1080.png",
                                      text: Strings.About.section1),

      .leftTextWithHeaderRightImage(imageSrc: "https://via.placeholder.com/1920x1080.png",
                                    header: Strings.About.whoWeAreTitle,
                                    p1: Strings.About.whoWeAreP1,
                                    p2: Strings.About.whoWeAreP2,
                                    p3: Strings.About.whoWeAreP3),

      .leftImageRightTextWithHeader(imageSrc: "https://via.placeholder.com/1920x1080.png",
                                    header: Strings.About.workWithUsTitle,
                                    p1: Strings.About.workWithusP1,
                                    p2: Strings.About.workWithusP2,
                                    p3: Strings.About.workWithusP3),

      .leftTextWithHeaderRightImage(imageSrc: "https://via.placeholder.com/1920x1080.png",
                                    header: Strings.About.helpingOthersTitle,
                                    p1: Strings.About.helpingOthersP1,
                                    p2: Strings.About.helpingOthersP2,
                                    p3: ""),

      .aboutCTA()
    ]
  }
}

public extension Node where Context == HTML.BodyContext {
  static func aboutHeader() -> Node {
    .header(
      .h1("Swift-Based", .br(), "App Development")
    )
  }

  static func leftImageWithRightTextNoHeader(imageSrc: String, text: String) -> Node {
    .section(
      .header(
        .img(.src(imageSrc))
      ),
      .main(
        .main(
          .p("\(text)")
        )
      )
    )
  }

  static func leftTextWithHeaderRightImage(imageSrc: String, header: String, p1: String, p2: String, p3: String) -> Node {
    .section(
      .header(
        .img(.src(imageSrc))
      ),
      .main(
        .header(
          .h2("\(header)")
        ),
        .main(
          .p("\(p1)"),
          .p("\(p2)"),
          .p("\(p3)")
        )
      )
    )
  }

  static func leftImageRightTextWithHeader(imageSrc: String, header: String, p1: String, p2: String, p3: String) -> Node {
    .section(
      .header(
        .img(.src(imageSrc))
      ),
      .main(
        .header(
          .h2("\(header)")
        ),
        .main(
          .p("\(p1)"),
          .p("\(p2)"),
          .p("\(p3)")
        )
      )
    )
  }

  static func aboutCTA() -> Node {
    .section(
      .header(
        .img(.src("https://via.placeholder.com/1920x1080.png"))
      ),
      .main(
        .header(
          .h2("\(Strings.About.ctaTitle)")
        ),
        .main(
          .p("\(Strings.About.ctaP1)"),
          .p(""),
          .hr(),
          .p("\(Strings.About.ctaP2)"),
          .a(
            .class("button"),
            .href("/contact-us"),
            .text("Let's Talk")
          ),
          .hr(),
          .p("\(Strings.About.ctaP3)"),
          .a(
            .class("button"),
            .href("/contact-us"),
            .text("Reach Out to Leo")
          )
        )
      )
    )
  }
}
