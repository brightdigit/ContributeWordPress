import Foundation
import LoremSwiftum
import Plot
import Publish

struct AboutBuilder: PageBuilder {
  func main(forLocation _: LocationType, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .mainForAbout()
    ]
  }
}

public extension Node where Context == HTML.BodyContext {
  static func mainForAbout() -> Node {
    .main(
      .header(
        .h1("Swift-Based"),
        .h1("App Development")
      )
    )
  }
}
