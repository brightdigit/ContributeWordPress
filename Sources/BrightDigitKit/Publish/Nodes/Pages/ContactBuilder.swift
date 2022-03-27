import Foundation
import Plot
import Publish

struct ContactBuilder: PageBuilder {
  let description: String = "Ready to talk about your app and if we can help you build it? Contact us now!"

  var imagePath: Path = "/media/contact-us.png"

  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .makeContactUsFormWithPicture(),
      .makeSocialMediaSection()
    ]
  }

  var bodyClasses: [String] { [] }
}

public extension Node where Context == HTML.BodyContext {
  // MARK: - makeContactUsFormWithPicture

  static func makeContactUsFormWithPicture() -> Node {
    .section(
      .id("contact-us-form"),
      .main(
        .header(
          .img(.src("/media/contact-us.svg"))
        ),
        .main(
          .div(
            .p("Want to chat about how we can help you and your company? Let us know how we help."),
            .form(
              .attribute(named: "name", value: "contact"),
              .method(.post),
              .data(named: "netlify", value: "true"),
              .div(
                .div(
                  .input(.type(.text), .name("first-name"), .placeholder("Leo")),
                  .label("First Name")
                ),
                .div(
                  .input(.type(.text), .name("last-name"), .placeholder("Dion")),
                  .label("Last Name")
                )
              ),
              .div(
                .div(
                  .input(.type(.text), .name("email"), .placeholder("leo@brightdigit.com")),
                  .label("Email")
                )
              ),
              .div(
                .div(
                  .textarea(.placeholder("You Message Here"), .name("message"))
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

  // MARK: - makeSocialMediaSection

  static func makeSocialMediaSection() -> Node {
    .section(
      .id("social-media"),
      .main(
        .header(
          .img(
            .src("/media/social-media.svg")
          )
        ),
        .main(
          .p("There are other ways to get a hold of us too."),
          .ol(
            .class("social"),
            .makeIconWithText("Twitter @brightdigit", href: "/", flatIcon: "twitter"),
            .makeIconWithText("GitHub @brightdigit", href: "/", flatIcon: "github"),
            .makeIconWithText("EmpowerApps.Show Podcast", href: "/", flatIcon: "podcast"),
            .makeIconWithText("Youtube videos", href: "/", flatIcon: "youtube"),
            .makeIconWithText("Our Newsletter", href: "/", flatIcon: "newletter"),
            .makeIconWithText("Our Feed", href: "/", flatIcon: "rss")
          )
        )
      )
    )
  }
}

// MARK: - makeIconWithText

public extension Node where Context == HTML.ListContext {
  static func makeIconWithText(_ text: String, href: String, flatIcon: String) -> Node {
    .li(
      .a(
        .href(href),
        .i(.class("flaticon-\(flatIcon)")),
        .text(text)
      )
    )
  }
}
