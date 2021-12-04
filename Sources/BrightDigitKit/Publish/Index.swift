import Foundation
import LoremSwiftum
import Plot
import Publish

// MARK: - BodyContext

public extension Node where Context == HTML.BodyContext {
  // MARK: - sectionForHero

  static func sectionForHero() -> Node {
    .section(
      .class("hero"),
      .main(
        .img(.src("https://via.placeholder.com/1920x1080.png")),
        .section(
          .class("text"),
          .main(
            .text("Your one-stop-shop to build great apps with Swift")
          ),
          .a(.href("/contact-us"), .text("Get Started"))
        )
      )
    )
  }

  // MARK: - sectionForServices

  static func sectionForServices() -> Node {
    .section(
      .class("services"),
      .header(
        .h2("Experts in Swift"),
        .img(.src("/media/services/001-swift.svg"))
      ),
      .ol(
        .makeService(title: "Is your app still at the idea stage?",
                     imageSrc: "/media/services/003-iphone.svg",
                     paragraph: "We provide consulting servcies to make sure you can deliver the best user experience from the ground up."),
        .makeService(title: "Have you started development and need specialist support?",
                     imageSrc: "/media/services/002-smartwatch-app.svg",
                     paragraph: "We specialize in Swift development for apps, large and small. If you've run into development trouble, we can help get back on track"),
        .makeService(title: "Do you have an existing app but want to go bigger, better or port to an Apple platform?",
                     imageSrc: "/media/services/004-cloud.svg",
                     paragraph: "We belive that platform-native development is almost always best. If you have an app for Android we can help you make a twin app that works seamlessly on iOS.")
      )
    )
  }

  // MARK: - sectionForTestimonials

  static func sectionForTestimonials() -> Node {
    .section(
      .id("testimonials"),
      .header(
        .h2("Testimonials")
      ),
      .ol(
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial(),
        .loremIpsumTestimonial()
      )
    )
  }

  // MARK: - Latest Articles

  static func sectionForLatestArticles() -> Node {
    .section(
      .id("posts"),
      .header(
        .h2("Latest")
      ),
      .ol(
        .loremIpsumArticle(),
        .loremIpsumArticle(),
        .loremIpsumArticle(),
        .loremIpsumArticle(),
        .loremIpsumArticle(),
        .loremIpsumArticle(),
        .loremIpsumArticle(),
        .loremIpsumArticle()
      )
    )
  }

  static func sectionForContactUs() -> Node {
    .section(
      .id("contact-us"),
      .main(
        .div(
          .p("Learn more about what we do.")
        ),
        .a(
          .href("/contact-us"),
          .text("Contact Us")
        )
      )
    )
  }
}

// MARK: - ListContext

public extension Node where Context == HTML.ListContext {
  private static func makeService(title: String, imageSrc: String, paragraph: String) -> Node {
    .li(
      .header(
        .h3(.text(title)),
        .img(.src(imageSrc))
      ),
      .main(
        .p(.text(paragraph))
      )
    )
  }

  static func loremIpsumTestimonial() -> Node {
    .li(
      .element(named: "figure", nodes: [.blockquote(
        .p(
          .text(Lorem.sentences(2))
        )
      ), .element(named: "figcaption", nodes: [
        .text("-"),
        .text(Lorem.fullName),
        .text(", "),
        .element(named: "cite", nodes: [.text(Lorem.title)])
      ])])
    )
  }

  static func loremIpsumArticle() -> Node {
    .li(
      .header(
        .img(.src("http://placeimg.com/200/150/tech/\(UUID().uuidString)")),
        .h3(.text(Lorem.title)),
        .ol(
          .li(.text(Lorem.word))
        ),
        .ol(
          .group(
            (1 ... Int.random(in: 1 ... 3)).map { _ in Lorem.word }.map { .text($0) }.map { .li($0) }
          )
        )
      ),
      .main(
        .p(.text(Lorem.sentences(2)))
      ),
      .footer(
        .div(
          .class("publishedAt"),
          .text("Feb 2, 2021") // Date(timeIntervalSinceNow: .random(in: 1.365) * 86400.0)
        ),
        .div(
          .class("readTime"),
          .text("4 mins read") // Date(timeIntervalSinceNow: .random(in: 1.365) * 86400.0)
        )
      )
    )
  }
}
