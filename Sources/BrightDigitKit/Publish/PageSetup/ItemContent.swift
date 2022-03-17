import Plot

struct ItemContent<ItemType: SectionItem>: PageContent {
  let item: ItemType

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
}
