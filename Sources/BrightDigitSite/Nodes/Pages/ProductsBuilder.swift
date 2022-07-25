import Foundation
import Plot
import Publish
import PublishType

struct ProductsBuilder: PageBuilder {
  let description: String = "Here are some of the apps and libraries we’ve created. Like what you see? Contact us to find out if we can help you reach your app goals."

  var imagePath: Path = "livestream/Heartwitch-BOTW-HCG.png"

  internal init(products: [Product] = Product.all) {
    self.products = products
  }

  let products: [Product]
  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .header(
        .h1(.text("Products"))
      ),
      .ol(
        .forEach(products) { product in
          Node.component(ListItem(forProduct: product))
        }
      )
    ]
  }

  var bodyClasses: [String] { [] }
}
