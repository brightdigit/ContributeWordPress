import Plot
import Publish
import PublishType

struct ServicesBuilder: PageBuilder {
  let imagePath: Path = "/media/services/new2-12.png"

  let description: String = "Is your app making customers and driving sales? We help you create, rebuild and port apps to excite customers and boost your business."

  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .components {
        Header {
          Element(name: "section") {
            Paragraph {
              Text("We work with ")
              Text("companies and agencies").italic()
              Text(" that want Swift-based apps that are:")
            }
            H1 {
              Text("Intuitive.").addLineBreak()
              Text("Effective.").addLineBreak()
              Text("Well-Designed.")
            }
          }
        }
        ServiceBox(
          id: "iPhone-service",
          bigImage: .init(url: "/media/services/new2-12.png", description: "Building a Brand New App"),
          smallImage: Image(url: "/media/services/003-iphone.svg",
                            description: "iPhone"),
          title: "New App Development",
          text: Strings.Services.iOSDevelopment
        )

        ServiceBox(
          id: "swift-service",
          bigImage: .init(url: "/media/services/12-agustus-outline-02.png",
                          description: "Upgrading an Existing App"),
          smallImage: Image(url: "/media/services/001-swift.svg",
                            description: "Swift Logo"),
          title: "Upgrade Your Existing App",
          text: Strings.Services.consulting
        )

        ServiceBox(
          id: "apple-service",
          bigImage: .init(url: "/media/services/mar6-outline-07.png",
                          description: "Porting an app over"),
          smallImage: .init(url: "/media/services/002-smartwatch-app.svg",
                            description: "Apple Watch"),
          title: "Port Your App to Apple Platforms",
          text: Strings.Services.appleDevelopment
        )

        Element(name: "section") {
          Element(name: "main") {
            Header {
              H2 {
                Text("Check out some of the ")
                Text("work").bold()
                Text(" we've done...")
              }
            }
            Footer {
              Link("Our Work", url: "/products").class("button")
            }
          }
        }.class("products-cta")
      }
    ]
  }

  var bodyClasses: [String] { [] }
}
