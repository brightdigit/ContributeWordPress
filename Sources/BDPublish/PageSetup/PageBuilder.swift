import Foundation
import Plot
import Publish

protocol PageBuilder: AnyPageMainBuilder, ContentBuilder where LocationType == Page {}

extension PageBuilder {
  func pageSetup(forPage page: Page, withContext context: PublishingContext<BrightDigitSite>) -> PageContent {
    DynamicPageContent(builder: self, location: page, context: context)
  }
}
