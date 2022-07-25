import Foundation
import Plot
import Publish

public protocol ContentBuilder {
  associatedtype LocationType: Location
  associatedtype WebsiteType: Website
  func main(forLocation location: LocationType, withContext context: PublishingContext<WebsiteType>) -> [Node<HTML.BodyContext>]
  var bodyClasses: [String] { get }
  var description: String { get }
  var imagePath: Path { get }
}
