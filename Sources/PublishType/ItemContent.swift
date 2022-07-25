import Foundation
import Plot
import Publish

public extension URL {
  init(staticString: String) {
    self.init(string: staticString)!
  }
}

public extension Item {
  var rootRelativeURL: URL {
    URL(staticString: "/\(path)")
  }

  func absoluteURL(forSite site: Site) -> URL {
    site.url(for: path)
  }
}

public struct ItemContent<ItemType: SectionItem,
  WebsiteType>: PageContent where ItemType.WebsiteType == WebsiteType {
  public init(item: ItemType, context: PublishingContext<WebsiteType>) {
    self.item = item
    self.context = context
  }

  public var description: String {
    item.description
  }

  public var socialTitle: String {
    item.pageTitle
  }

  public var socialImageURL: URL {
    context.site.absoluteURL(for: item.featuredImageURL)
  }

  public var absoluteURL: URL {
    item.source.absoluteURL(forSite: context.site)
  }

  let item: ItemType
  let context: PublishingContext<WebsiteType>

  public var title: String {
    item.pageTitle
  }

  public var bodyID: String? {
    item.pageBodyID
  }

  public var bodyClasses: [String] {
    [item.source.sectionID.rawValue]
  }

  public var main: [Node<HTML.BodyContext>] {
    item.pageMainContent
  }

  public var redirectURL: URL? {
    item.redirectURL
  }

  public var canonicalURL: URL? {
    redirectURL ?? absoluteURL
  }
}
