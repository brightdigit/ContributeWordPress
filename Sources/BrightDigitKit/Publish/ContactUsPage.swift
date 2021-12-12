import Plot
import Publish

public extension Node where Context == HTML.BodyContext {
  // MARK: - makeContactUsBody

  static func makeContactUsBody() -> Node {
    .main(
      .makeContactUsFormWithPicture(),
      .makeSocialMediaSection()
    )
  }

  // MARK: - makeContactUsFormWithPicture

  static func makeContactUsFormWithPicture() -> Node {
    .section(
      .id("contact-us-form"),
      .main(
        .header(
          .img(.class("rounded-lg"),
               .src("http://placeimg.com/800/450/tech/CF994871-96B0-4257-A9F8-73FFDF87C015"))
        ),
        .main(
          .div(
            .p("Want to chat about how we can help you and your company? Let us know how we help."),
            .form(
              .div(
                .div(
                  .input(.type(.text), .placeholder("Leo")),
                  .label("First Name")
                ),
                .div(
                  .input(.type(.text), .placeholder("Dion")),
                  .label("Last Name")
                )
              ),
              .div(
                .div(
                  .input(.type(.text), .placeholder("leo@brightdigit.com")),
                  .label("Email")
                )
              ),
              .div(
                .div(
                  .textarea(.placeholder("You Message Here"))
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
            .src("https://via.placeholder.com/1920x1080.png"),
            .class("rounded-lg")
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
