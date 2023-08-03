import Contribute
import Foundation

public struct HTMLtoMarkdown: MarkdownGenerator {
  public init(_ markdownFromHTML: @escaping (String) throws -> String) {
    self.markdownFromHTML = markdownFromHTML
  }

  public let markdownFromHTML: (String) throws -> String
  public func markdown(fromHTML htmlString: String) throws -> String {
    try markdownFromHTML(htmlString)
  }
}
