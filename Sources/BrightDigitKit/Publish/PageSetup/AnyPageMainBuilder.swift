import Foundation
import Plot
import Publish

protocol AnyPageMainBuilder {
  func pageSetup(forPage page: Page, withContext context: PublishingContext<BrightDigitSite>) -> PageContent
}
