import Foundation
import Plot
import Publish

public protocol SectionBuilderProtocol {
  associatedtype ChildType: SectionItem
  associatedtype WebsiteType: Website
  var section: Section<WebsiteType> { get }
  var children: [ChildType] { get }
  var featuredItem: ChildType { get }
  var description: String { get }
  var title: String { get }
  var h1: String? { get }
}
