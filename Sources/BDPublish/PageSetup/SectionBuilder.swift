import Foundation
import Plot
import Publish

struct SectionBuilder<ChildType: SectionItem>: SectionBuilderProtocol {
  var h1: String? {
    ChildType.sectionH1
  }

  var title: String {
    ChildType.sectionTitle
  }

  var description: String {
    ChildType.sectionDescription
  }

  internal init(section: Section<BrightDigitSite>, children: [ChildType], featuredItem: ChildType) {
    self.section = section
    self.children = children
    self.featuredItem = featuredItem
  }

  let section: Section<BrightDigitSite>
  let children: [ChildType]
  let featuredItem: ChildType
}
