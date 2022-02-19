import Foundation
import Plot
import Publish

enum Pages {
  fileprivate static let pageBuilders: [String: AnyPageMainBuilder] = [
    "services": ServicesBuilder(),
    "contact-us": ContactBuilder(),
    "products": ProductsBuilder(),
    "about-us": AboutBuilder()
  ]

  fileprivate static let sectionFactories: [String: SectionContentFactory.Type] = [
    "newsletters": NewsletterItem.self,
    "articles": ArticleItem.self,
    "episodes": PodcastItem.self,
    "tutorials": TutorialItem.self
  ]

  static func page(forIndex index: Index, withContext context: PublishingContext<BrightDigitSite>) -> PageContent {
    DynamicPageContent(builder: IndexBuilder(), location: index, context: context)
  }

  static func content(basedOnPage page: Page, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    guard let builder = pageBuilders[page.path.string] else {
      throw PiError.missingContentFor(page)
    }

    return builder.pageSetup(forPage: page, withContext: context)
  }

  static func sectionFactory(basedOn location: SectionLocation) throws -> SectionContentFactory.Type {
    guard let factory = sectionFactories[location.sectionID.rawValue] else {
      throw PiError.missingContentFor(location)
    }

    return factory
  }

  static func content(forSection section: Section<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    try sectionFactory(basedOn: section)
      .content(forSection: section, withContext: context)
  }

  static func content(forItem item: Item<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    try sectionFactory(basedOn: item)
      .content(forItem: item, withContext: context)
  }
}
