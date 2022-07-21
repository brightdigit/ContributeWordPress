import BDSite
import Foundation
import Plot
import Publish

enum Pages {
  static func page(forIndex index: Index, withContext context: PublishingContext<BrightDigitSite>) -> PageContent {
    DynamicPageContent(builder: IndexBuilder(), location: index, context: context)
  }

  static func content(basedOnPage page: Page, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    switch page.path.string {
    case "services": return ServicesBuilder().pageSetup(forPage: page, withContext: context)
    case "contact-us": return ContactBuilder().pageSetup(forPage: page, withContext: context)
    case "products": return ProductsBuilder().pageSetup(forPage: page, withContext: context)
    case "about-us": return AboutBuilder().pageSetup(forPage: page, withContext: context)
    default: throw PiError.missingContentFor(page)
    }
  }

  static func content(forSection section: Section<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    switch section.id.rawValue {
    case "newsletters": return try NewsletterItem.content(forSection: section, withContext: context)
    case "articles": return try ArticleItem.content(forSection: section, withContext: context)
    case "episodes": return try PodcastItem.content(forSection: section, withContext: context)
    case "tutorials": return try TutorialItem.content(forSection: section, withContext: context)
    default: throw PiError.missingContentFor(section)
    }
  }

  static func content(forItem item: Item<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    switch item.sectionID.rawValue {
    case "newsletters": return try NewsletterItem.content(forItem: item, withContext: context)
    case "articles": return try ArticleItem.content(forItem: item, withContext: context)
    case "episodes": return try PodcastItem.content(forItem: item, withContext: context)
    case "tutorials": return try TutorialItem.content(forItem: item, withContext: context)
    default: throw PiError.missingContentFor(item)
    }
  }
}
