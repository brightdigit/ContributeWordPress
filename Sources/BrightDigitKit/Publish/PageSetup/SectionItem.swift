import Foundation
import Plot
import Publish

protocol SectionItem: SectionContentFactory {
  var featuredItemContent: Node<HTML.BodyContext> { get }
  var sectionItemContent: [Node<HTML.BodyContext>] { get }
  var isFeatured: Bool { get }
  var source: Item<BrightDigitSite> { get }

  var pageTitle: String { get }

  var pageBodyID: String? { get }

  var pageMainContent: [Node<HTML.BodyContext>] { get }

  init(item: Item<BrightDigitSite>, site: BrightDigitSite) throws
}
