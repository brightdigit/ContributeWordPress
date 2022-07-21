import Publish

public protocol SectionContentFactory {
  associatedtype WebsiteType: Website
  static func content(forSection section: Section<WebsiteType>, withContext _: PublishingContext<WebsiteType>) throws -> PageContent
  static func content(forItem item: Item<WebsiteType>, withContext _: PublishingContext<WebsiteType>) throws -> PageContent
}
