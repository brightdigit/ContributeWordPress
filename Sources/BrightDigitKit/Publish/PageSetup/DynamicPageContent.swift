import Foundation
import Plot
import Publish

struct DynamicPageContent<BuilderType: ContentBuilder>: PageContent {
  init(builder: BuilderType, location: BuilderType.LocationType, context: PublishingContext<BrightDigitSite>) {
    self.builder = builder
    self.location = location
    self.context = context
  }

  let builder: BuilderType
  let location: BuilderType.LocationType
  let context: PublishingContext<BrightDigitSite>

  var title: String {
    location.title
  }

  var main: [Node<HTML.BodyContext>] {
    builder.main(forLocation: location, withContext: context)
  }

  var bodyID: String? {
    location.path.string
  }

  var bodyClasses: [String] {
    []
  }
}
