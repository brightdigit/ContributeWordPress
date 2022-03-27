import Foundation
import Plot
import Publish

struct ItemContent<ItemType: SectionItem>: PageContent {
  var description: String {
    item.description
  }

  var socialTitle: String {
    item.pageTitle
  }

  var socialImageURL: URL {
    context.site.absoluteURL(for: item.featuredImageURL)
  }

  var absoluteURL: URL {
    item.source.absoluteURL(forSite: context.site)
  }

  let item: ItemType
  let context: PublishingContext<BrightDigitSite>

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

  var redirectURL: URL? {
    item.redirectURL
  }

  var canonicalURL: URL? {
    redirectURL ?? absoluteURL
  }
}
