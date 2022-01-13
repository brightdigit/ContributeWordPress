import Foundation
import Plot
import Publish

struct SectionBuilder<ChildType: SectionItem>: SectionBuilderProtocol {
  internal init(section: Section<BrightDigitSite>, children: [ChildType], featuredItem: ChildType) {
    self.section = section
    self.children = children
    self.featuredItem = featuredItem
  }

  let section: Section<BrightDigitSite>
  let children: [ChildType]
  let featuredItem: ChildType

  func pageSetup(withContext _: PublishingContext<BrightDigitSite>) -> PageContent {
    SectionContent(builder: self)
  }
}
