import Foundation
import Plot
import Publish

struct SectionContent<SectionBuilderType: SectionBuilderProtocol>: PageContent {
  let builder: SectionBuilderType

  var title: String {
    builder.section.title
  }

  var bodyID: String? {
    builder.section.id.rawValue
  }

  var main: [Node<HTML.BodyContext>] {
    [
      .section(
        .class("featured"),
        .forEach(builder.featuredItem.featuredItemContent) { $0 }
      ),
      .section(
        .ol(
          .forEach(builder.children) { .li(
            .forEach($0.itemContent) { $0 }
          ) }
        )
      )
    ]
  }
}
