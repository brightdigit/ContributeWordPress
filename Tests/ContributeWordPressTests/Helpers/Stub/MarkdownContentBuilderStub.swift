import Contribute
import ContributeWordPress
import Foundation

internal final class MarkdownContentBuilderStub: MarkdownContentBuilder {
  internal typealias SourceType = Source

  internal func content(
    from source: SourceType,
    using htmlToMarkdown: @escaping (String) throws -> String
  ) throws -> String {
    try htmlToMarkdown(source.html)
  }
}
