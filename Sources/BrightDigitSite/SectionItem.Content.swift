import Publish
import PublishType

extension SectionItem {
  static func content(forSection section: Section<WebsiteType>, withContext context: PublishingContext<WebsiteType>) throws -> PageContent where WebsiteType == BrightDigitSite {
    let allChildren = try section.items.map {
      try Self(item: $0, site: context.site)
    }
    let featuredIndex = allChildren.firstIndex(where: { $0.isFeatured }) ?? allChildren.startIndex
    var children = allChildren
    children.remove(at: featuredIndex)
    let builder = SectionBuilder(section: section, children: children, featuredItem: allChildren[featuredIndex])
    return SectionContent(builder: builder, context: context)
  }

  static func content(forItem item: Item<WebsiteType>, withContext context: PublishingContext<WebsiteType>) throws -> PageContent {
    let object = try Self(item: item, site: context.site)
    return ItemContent(item: object, context: context)
  }
}
