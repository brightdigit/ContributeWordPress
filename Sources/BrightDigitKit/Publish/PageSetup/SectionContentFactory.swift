import Publish

protocol SectionContentFactory {
  static func content(forSection section: Section<BrightDigitSite>, withContext _: PublishingContext<BrightDigitSite>) throws -> PageContent
  static func content(forItem item: Item<BrightDigitSite>, withContext _: PublishingContext<BrightDigitSite>) throws -> PageContent
}
