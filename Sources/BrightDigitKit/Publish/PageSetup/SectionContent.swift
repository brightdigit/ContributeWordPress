import Foundation
import Plot
import Publish

struct SectionContent<SectionBuilderType: SectionBuilderProtocol>: PageContent {
  let builder: SectionBuilderType

  var title: String {
    builder.section.title
  }

  var bodyClasses: [String] {
    []
  }

  var bodyID: String? {
    builder.section.id.rawValue
  }

  var main: [Node<HTML.BodyContext>] {
    [
      .class("section"),

      featuredNode,

      .section(
        .ol(
          .forEach(builder.children) { .li(
            .forEach($0.sectionItemContent) { $0 }
          ) }
        )
      )
    ]
  }

  var featuredNode: Node<HTML.BodyContext> {
    builder.featuredItem.featuredItemContent
  }
}
