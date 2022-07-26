import Foundation
import Plot
import Publish

public struct SectionBuilder<ChildType: SectionItem,
  WebsiteType: Website>: SectionBuilderProtocol {
  public var h1: String? {
    ChildType.sectionH1
  }

  public var title: String {
    ChildType.sectionTitle
  }

  public var description: String {
    ChildType.sectionDescription
  }

  public init(section: Section<WebsiteType>, children: [ChildType], featuredItem: ChildType) {
    self.section = section
    self.children = children
    self.featuredItem = featuredItem
  }

  public let section: Section<WebsiteType>
  public let children: [ChildType]
  public let featuredItem: ChildType
}
