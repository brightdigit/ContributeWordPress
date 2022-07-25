import Foundation
import Plot
import Publish

public protocol AnyPageMainBuilder {
  associatedtype WebsiteType: Website
  func pageSetup(forPage page: Page, withContext context: PublishingContext<WebsiteType>) -> PageContent
}
