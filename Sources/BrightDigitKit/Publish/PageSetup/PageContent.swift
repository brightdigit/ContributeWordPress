import Foundation
import Plot

public protocol PageContent {
  var title: String { get }
  var description: String { get }
  var socialTitle: String { get }
  var socialImageURL: URL { get }
  var absoluteURL: URL { get }
  var main: [Node<HTML.BodyContext>] { get }
  var bodyID: String? { get }
  var bodyClasses: [String] { get }
  var redirectURL: URL? { get }
  var canonicalURL: URL? { get }
}

extension PageContent {
  var mainElement: Node<HTML.BodyContext> {
    .main(
      .forEach(main) { $0 }
    )
  }

  var bodyClassValue: String? {
    let value = bodyClasses
      .joined(separator: " ")
      .trimmingCharacters(in: .whitespacesAndNewlines)
    guard value.count > 0 else {
      return nil
    }

    return value
  }

  var headTitle: String {
    [title, "BrightDigit"].joined(separator: " | ")
  }
}
