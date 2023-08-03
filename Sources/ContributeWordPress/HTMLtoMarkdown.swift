import Contribute
import Foundation

@available(*, deprecated, message: "Use `HTMLtoMarkdown` in `Contribute`.")
public struct HTMLtoMarkdown: MarkdownGenerator {
  public let markdownFromHTML: (String) throws -> String

  public init(_ markdownFromHTML: @escaping (String) throws -> String) {
    self.markdownFromHTML = markdownFromHTML
  }

  public func markdown(fromHTML htmlString: String) throws -> String {
    try markdownFromHTML(htmlString)
  }
}
