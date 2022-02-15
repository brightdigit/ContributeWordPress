import Foundation
import Plot
import Publish

struct ProductsBuilder: PageBuilder {
  internal init(products: [Product] = Product.all) {
    self.products = products
  }

  let products: [Product]
  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .ol(
        .forEach(products, Product.listItem)
      )
    ]
  }
}
