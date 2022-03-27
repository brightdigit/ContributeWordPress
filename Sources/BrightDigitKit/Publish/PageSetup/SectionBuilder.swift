import Foundation
import Plot
import Publish

struct SectionBuilder<ChildType: SectionItem>: SectionBuilderProtocol {
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

  func pageSetup(withContext context: PublishingContext<BrightDigitSite>) -> PageContent {
    SectionContent(builder: self, context: context)
  }
}
