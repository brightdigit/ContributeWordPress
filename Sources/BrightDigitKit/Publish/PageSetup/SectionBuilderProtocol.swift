import Foundation
import Plot
import Publish

protocol SectionBuilderProtocol {
  associatedtype ChildType: SectionItem
  var section: Section<BrightDigitSite> { get }
  var children: [ChildType] { get }
  var featuredItem: ChildType { get }
}
