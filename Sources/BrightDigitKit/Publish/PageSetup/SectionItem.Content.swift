import Publish

extension SectionItem {
  static func content(forSection section: Section<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    let allChildren = try section.items.map {
      try Self(item: $0, site: context.site)
    }
    let featuredIndex = allChildren.firstIndex(where: { $0.isFeatured }) ?? allChildren.startIndex
    var children = allChildren
    children.remove(at: featuredIndex)
    let builder = SectionBuilder(section: section, children: children, featuredItem: allChildren[featuredIndex])
    return SectionContent(builder: builder, context: context)
  }

  static func content(forItem item: Item<BrightDigitSite>, withContext context: PublishingContext<BrightDigitSite>) throws -> PageContent {
    let object = try Self(item: item, site: context.site)
    return ItemContent(item: object, context: context)
  }
}
