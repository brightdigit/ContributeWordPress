import Plot

public protocol PageContent {
  var title: String { get }
  var main: [Node<HTML.BodyContext>] { get }
  var bodyID: String? { get }
}

extension PageContent {
  var mainElement: Node<HTML.BodyContext> {
    .main(
      .forEach(main) { $0 }
    )
  }
}
