import Foundation
import Plot
import Publish

public protocol SectionItem: SectionContentFactory {
  var featuredItemContent: Node<HTML.BodyContext> { get }
  var sectionItemContent: [Node<HTML.BodyContext>] { get }
  var isFeatured: Bool { get }
  var source: Item<WebsiteType> { get }
  static var sectionH1: String? { get }
  static var sectionTitle: String { get }
  static var sectionDescription: String { get }
  var description: String { get }
  var pageTitle: String { get }

  var pageBodyID: String? { get }

  var pageMainContent: [Node<HTML.BodyContext>] { get }

  var redirectURL: URL? { get }
  var featuredImageURL: URL { get }

  init(item: Item<WebsiteType>, site: WebsiteType) throws
}
