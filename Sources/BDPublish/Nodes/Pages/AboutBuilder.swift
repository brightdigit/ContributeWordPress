import BDSite
import Foundation
import Plot
import Publish

struct AboutBuilder: PageBuilder {
  typealias WebsiteType = BrightDigitSite

  typealias LocationType = Page

  let description: String = Strings.About.ctaP1

  var imagePath: Path = "/media/about-us/graphic-attract.jpg"

  func main(forLocation _: LocationType, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .aboutHeader(),
      .leftImageWithRightTextNoHeader(imageSrc: "/media/about-us/graphic-attract.webm",
                                      text: Strings.About.section1),

      .leftTextWithHeaderRightImage(imageSrc: "/media/about-us/opportunities.webm",
                                    header: Strings.About.whoWeAreTitle,
                                    p1: Strings.About.whoWeAreP1,
                                    p2: Strings.About.whoWeAreP2,
                                    p3: Strings.About.whoWeAreP3),

      .leftImageRightTextWithHeader(imageSrc: "/media/about-us/communication.webm",
                                    header: Strings.About.workWithUsTitle,
                                    p1: Strings.About.workWithusP1,
                                    p2: Strings.About.workWithusP2,
                                    p3: Strings.About.workWithusP3),

      .leftTextWithHeaderRightImage(imageSrc: "/media/about-us/podcast.webm",
                                    header: Strings.About.helpingOthersTitle,
                                    p1: Strings.About.helpingOthersP1,
                                    p2: Strings.About.helpingOthersP2,
                                    p3: ""),

      .aboutCTA()
    ]
  }

  var bodyClasses: [String] { [] }
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
        .video(
          .attribute(named: "autoplay"),
          .attribute(named: "muted"),
          .source(.src(imageSrc), .type(.webM))
        )
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
        .video(
          .attribute(named: "autoplay"),
          .attribute(named: "muted"),
          .attribute(named: "loop"),
          .source(.src(imageSrc), .type(.webM))
        )
      ),
      .main(
        .header(
          .h2("\(header)")
        ),
        .main(
          .markdown(p1),
          .markdown(p2),
          .markdown(p3)
        )
      )
    )
  }

  static func leftImageRightTextWithHeader(imageSrc: String, header: String, p1: String, p2: String, p3: String) -> Node {
    .section(
      .header(
        .video(
          .attribute(named: "autoplay"),
          .attribute(named: "muted"),
          .attribute(named: "loop"),
          .source(.src(imageSrc), .type(.webM))
        )
      ),
      .main(
        .header(
          .h2("\(header)")
        ),
        .main(
          .markdown(p1),
          .markdown(p2),
          .markdown(p3)
        )
      )
    )
  }

  static func aboutCTA() -> Node {
    .section(
      .header(
        .video(
          .attribute(named: "autoplay"),
          .attribute(named: "muted"),
          .attribute(named: "loop"),
          .source(.src("/media/about-us/am-try.webm"), .type(.webM))
        )
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
