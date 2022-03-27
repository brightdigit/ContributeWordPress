import Foundation
import Plot
import Publish

struct DynamicPageContent<BuilderType: ContentBuilder>: PageContent {
  var description: String {
    builder.description
  }

  var socialTitle: String {
    title
  }

  var socialImageURL: URL {
    context.site.url(for: builder.imagePath)
  }

  var absoluteURL: URL {
    context.site.url(for: location)
  }

  var canonicalURL: URL? {
    absoluteURL
  }

  init(builder: BuilderType, location: BuilderType.LocationType, context: PublishingContext<BrightDigitSite>) {
    self.builder = builder
    self.location = location
    self.context = context
  }

  let builder: BuilderType
  let location: BuilderType.LocationType
  let context: PublishingContext<BrightDigitSite>

  var title: String {
    if BuilderType.self == IndexBuilder.self {
      return BrightDigitSite.SiteInfo.title
    } else {
      return location.title
    }
  }

  var main: [Node<HTML.BodyContext>] {
    builder.main(forLocation: location, withContext: context)
  }

  var bodyID: String? {
    location.path.string
  }

  var bodyClasses: [String] {
    builder.bodyClasses
  }

  var redirectURL: URL? {
    nil
  }
}
