import Contribute
import ContributeWordPress
import Foundation

internal final class MarkdownContentBuilderStub: MarkdownContentBuilder {
  internal typealias SourceType = Source

  internal func content(
    from _: SourceType,
    using _: @escaping (String) throws -> String
  ) throws -> String {
    "fake content"
  }
}
