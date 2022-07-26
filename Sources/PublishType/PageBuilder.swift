import Foundation
import Plot
import Publish

public protocol PageBuilder: AnyPageMainBuilder, ContentBuilder where LocationType == Page {}

public extension PageBuilder {
  func pageSetup(forPage page: Page, withContext context: PublishingContext<WebsiteType>) -> PageContent {
    DynamicPageContent(builder: self, location: page, context: context)
  }
}
