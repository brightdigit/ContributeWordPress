import Plot

public struct MockContent: PageContent {
  internal init(title: String = "titleHere", text: String = "this is a default page") {
    self.title = title
    self.text = text
  }

  public let title: String
  public let text: String
  public let bodyID: String? = nil
  public var main: [Node<HTML.BodyContext>] {
    [
      .text(text)
    ]
  }
}
