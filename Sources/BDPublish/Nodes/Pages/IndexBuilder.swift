import Foundation
import Plot
import Publish

// MARK: - BodyContext

struct IndexBuilder: ContentBuilder {
  let description: String = BrightDigitSite.SiteInfo.description
  var imagePath: Path = BrightDigitSite.SiteInfo.imagePath

  func main(forLocation _: Index, withContext context: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .mainHeader(),
      .sectionForServices(),
      .sectionForTestimonials(),
      .sectionForLatestArticles(basedOn: context),
      .sectionForNewsletterCTA()
    ]
  }

  var bodyClasses: [String] { [] }

  typealias LocationType = Index
}

public extension Node where Context == HTML.BodyContext {
  // MARK: - Main Header

  static func mainHeader() -> Node {
    .header(
      .main(
        .header(
          .h1("Your Experts in Swift App Development")
        ),
        .sectionForHero1(),
        .sectionForHero2()
      ),
      .footer(
        .video(
          .attribute(named: "autoplay"),
          .attribute(named: "muted"),
          .attribute(named: "loop"),
          .source(
            .src("/media/iPhone.mov"),
            .attribute(named: "type", value: "video/quicktime")
          ),
          .source(
            .src("/media/iPhone.webm"),
            .type(.webM)
          )
        )
      )
    )
  }

  // MARK: - sectionForHero

  static func sectionForHero1() -> Node {
    .section(
      .class("hero"),
      .main(
        .section(
          .class("text"),
          .main("Join our newsletter to be the first to know when we have availability, plus advice on what's new with Apple apps and products.")
        ),
        .footer(
          .a(.href("/newsletters"), .text("Subscribe Now"))
        )
      )
    )
  }

  static func sectionForHero2() -> Node {
    .section(
      .class("hero"),
      .header(
        .img(.src("/media/swift-heroes.jpg"), .alt("Leo presenting at Swift Heroes"))
      ),
      .main(
        .section(
          .class("text"),
          .main("Founded in 2021, BrightDigit aims to provide you with the very best in Swift-based development for the Apple ecosystem.")
        ),
        .footer(
          .a(.href("/about-us"), .text("Learn more about us"))
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
        .img(.src("/media/services/001-swift.svg"), .alt("Swift Logo"))
      ),
      .ol(
        .makeService(title: "Is your app still at the idea stage?",
                     imageSrc: "/media/services/003-iphone.svg",
                     imageAlt: "iPhone",
                     paragraph: "We provide consulting servcies to make sure you can deliver the best user experience from the ground up.",
                     linkID: "iPhone-service"),
        .makeService(title: "Have you started development and need specialist support?",
                     imageSrc: "/media/services/002-smartwatch-app.svg",
                     imageAlt: "Apple Watch",
                     paragraph: "We specialize in Swift development for apps, large and small. If you've run into development trouble, we can help get back on track",
                     linkID: "swift-service"),
        .makeService(title: "Do you have an existing app but want to go bigger, better or port to an Apple platform?",
                     imageSrc: "/media/services/004-cloud.svg",
                     imageAlt: "The Cloud",
                     paragraph: "We belive that platform-native development is almost always best. If you have an app for Android we can help you make a twin app that works seamlessly on iOS.",
                     linkID: "apple-service")
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
        .forEach(Testimonial.all.sorted(), Testimonial.listItem)
      )
    )
  }

  // MARK: - Latest Articles

  static func sectionForLatestArticles(basedOn context: PublishingContext<BrightDigitSite>) -> Node {
    let latestArticles = context.sections.compactMap(\.items.first)

    return .section(
      .id("posts"),
      .header(
        .h2("Latest")
      ),
      .ol(
        .forEach(latestArticles) { article in
          .latestArticle(article)
        }
      )
    )
  }

  // MARK: - sectionForNewsletterCTA

  static func sectionForNewsletterCTA() -> Node {
    .section(
      .class("newsletter-cta"),
      .header(
        .h2(.text("Don't Let Your App "), .em("Fall Behind"))
      ),
      .main(
        .p("Stay informed about the latest developments in the world of Swift App Development and what they could mean for your business.")
      ),
      .footer(
        .a(.href("/newsletters"), .text("Subscribe Now"))
      )
    )
  }
}

// MARK: - ListContext

public extension Node where Context == HTML.ListContext {
  private static func makeService(title: String, imageSrc: String, imageAlt: String, paragraph: String, linkID: String) -> Node {
    .li(
      .header(
        .h3(
          .a(.href("/services#\(linkID)"), .text(title))
        ),
        .img(.src(imageSrc), .alt(imageAlt))
      ),
      .main(
        .p(.text(paragraph))
      )
    )
  }

  static func latestArticle(_ article: IndexArticle) -> Node {
    .li(
      .header(
        .a(
          .href(article.rootRelativeURL),
          .img(.src(article.featuredImageURL)),
          .h3(.text(article.title))
        ),
        .ol(
          .forEach(article.tags) { tag in
            .li(.text(tag.string))
          }
        )
      ),
      .main(
        .p(.text(article.description))
      ),
      .footer(
        .a(
          .href(article.rootRelativeURL),
          .div(
            .class("publishedAt"),
            .text(
              PiHTMLFactory.itemFormatter.string(from: article.publishedAt)
            )
          ),
          .div(
            .class("readTime"),
            .text("\(article.lengthInMinutes) mins")
          )
        )
      )
    )
  }
}
