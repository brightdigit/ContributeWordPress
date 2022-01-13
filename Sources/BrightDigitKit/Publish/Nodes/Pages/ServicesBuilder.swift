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
    .section(
      .id("hero"),
      .main(
        .div(
          .img(.src("/media/brightdigit-logo.svg"))
        ),
        .div(
          .h1("Our Services"),
          .p(.text(Strings.Services.heroOption1))
        ),
        .div(
          .img(
            .class("rounded-lg"),
            .src("http://placeimg.com/800/450/tech/CF994871-96B0-4257-A9F8-73FFDF87C015")
          )
        )
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
        }
      )
    )
  }

  // MARK: - makeContactUsForm

  static func makeContactUsForm() -> Node {
    .section(
      .class("cta"),
      .id("contact-us-form"),
      .main(
        .main(
          .div(
            .p("Want to chat about how we can help you and your company? Let us know how we help."),
            .form(
              .div(
                .div(
                  .input(
                    .type(.text),
                    .placeholder("Leo")
                  ),
                  .label("First Name")
                ),
                .div(
                  .input(
                    .type(.text),
                    .placeholder("Dion")
                  ),
                  .label("Last Name")
                )
              ),
              .div(
                .div(
                  .input(
                    .type(.email),
                    .placeholder("leo@brightdigit.com")
                  ),
                  .label("Email Address")
                )
              ),
              .div(
                .div(
                  .textarea(.attribute(named: "placeholder", value: "Your Message Here"))
                )
              ),
              .div(
                .div(
                  .button("Send")
                )
              )
            )
          )
        )
      )
    )
  }

  // MARK: - makeSubscribeForm

  static func makeSubscribeForm() -> Node {
    .section(
      .class("cta"),
      .id("subscribe"),
      .main(
        .main(
          .p("If you want to keep in touch be sure to subscribe to our newsletter to stay up to date."),
          .form(
            .div(
              .div(
                .input(
                  .type(.email),
                  .placeholder("leo@brightdigit.com")
                ),
                .label("Email Address")
              )
            ),
            .div(
              .div(
                .button("Subscribe")
              )
            )
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
        bigImageSrc: "http://placeimg.com/800/450/tech/CF994871-96B0-4257-A9F8-73FFDF87C015",
        smallImageSrc: "/media/services/003-iphone.svg",
        title: "New App Development",
        paragraph: Strings.Services.iOSDevelopment
      ),

      .makeContactUsForm(),

      .makeServicesBox(classStr: "service",
                       id: "swift-service",
                       bigImageSrc: "http://placeimg.com/800/450/tech/CF994871-96B0-4257-A9F8-73FFDF87C015",
                       smallImageSrc: "/media/services/001-swift.svg",
                       title: "Upgrade Your Existing App",
                       paragraph: Strings.Services.consulting),

      .makeSubscribeForm(),

      .makeServicesBox(classStr: "service",
                       id: "apple-service",
                       bigImageSrc: "http://placeimg.com/800/450/tech/CF994871-96B0-4257-A9F8-73FFDF87C015",
                       smallImageSrc: "/media/services/002-smartwatch-app.svg",
                       title: "Port Your App to Apple Platforms",
                       paragraph: Strings.Services.appleDevelopment)
    ]
  }
}
