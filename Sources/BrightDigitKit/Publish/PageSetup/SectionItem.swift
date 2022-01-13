import Foundation
import Plot
import Publish

protocol SectionItem {
  var featuredItemContent: [Node<HTML.BodyContext>] { get }
  var itemContent: [Node<HTML.BodyContext>] { get }
  var isFeatured: Bool { get }
  init(item: Item<BrightDigitSite>) throws
}

extension SectionItem {
  static func content(forSection section: Section<BrightDigitSite>, withContext _: PublishingContext<BrightDigitSite>) throws -> PageContent {
    let allChildren = try section.items.map(Self.init(item:))
    let featuredIndex = allChildren.firstIndex(where: { $0.isFeatured }) ?? allChildren.startIndex
    var children = allChildren
    children.remove(at: featuredIndex)
    let builder = SectionBuilder(section: section, children: children, featuredItem: allChildren[featuredIndex])
    return SectionContent(builder: builder)
  }
}
