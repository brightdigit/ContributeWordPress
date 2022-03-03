import Foundation
import Plot
import Publish

protocol SectionItem: SectionContentFactory {
  var featuredItemContent: [Node<HTML.BodyContext>] { get }
  var sectionItemContent: [Node<HTML.BodyContext>] { get }
  var isFeatured: Bool { get }
  var source: Item<BrightDigitSite> { get }

  var pageTitle: String { get }

  var pageBodyID: String? { get }

  var pageMainContent: [Node<HTML.BodyContext>] { get }

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

  static func content(forItem item: Item<BrightDigitSite>, withContext _: PublishingContext<BrightDigitSite>) throws -> PageContent {
    let object = try Self(item: item)
    return ItemContent(item: object)
  }
}

struct ItemContent<ItemType: SectionItem>: PageContent {
  let item: ItemType

  var title: String {
    item.pageTitle
  }

  var bodyID: String? {
    item.pageBodyID
  }

  var bodyClasses: [String] {
    [item.source.sectionID.rawValue]
  }

  var main: [Node<HTML.BodyContext>] {
    item.pageMainContent
  }
}
