import Foundation
import Plot
import Publish

struct ProductsBuilder: PageBuilder {
  let products: [Product]

  internal init(products: [Product] = Product.all) {
    self.products = products
  }

  func main(forLocation _: Page, withContext _: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>] {
    [
      .ol(
        .forEach(products, Product.listItem)
      )
    ]
  }
}
