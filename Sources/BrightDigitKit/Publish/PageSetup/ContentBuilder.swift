import Foundation
import Plot
import Publish

protocol ContentBuilder {
  associatedtype LocationType: Location
  func main(forLocation location: LocationType, withContext context: PublishingContext<BrightDigitSite>) -> [Node<HTML.BodyContext>]
}
