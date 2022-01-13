import Foundation
import Plot
import Publish

enum Pages {
  typealias SectionContentFactory = (Section<BrightDigitSite>, PublishingContext<BrightDigitSite>) throws -> PageContent

  fileprivate static let pageBuilders: [String: AnyPageMainBuilder] = [
    "services": ServicesBuilder(),
    "contact-us": ContactBuilder()
  ]

  fileprivate static let sectionFactories: [String: SectionContentFactory] = [
    "newsletters": NewsletterItem.content,
    "articles": ArticleItem.content,
    "episodes": PodcastItem.content,
    "tutorials": TutorialItem.content
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

  static func content(forSection section: Section<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    guard let factory = sectionFactories[section.id.rawValue] else {
      throw PiError.missingContentFor(section)
    }

    return try factory(section, context)
  }
}
