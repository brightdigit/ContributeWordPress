import Contribute
import ContributeWordPress
import Foundation

internal final class MarkdownContentBuilderSpy: MarkdownContentBuilder {
  internal typealias SourceType = Source

  internal private(set) var isContentCalled = false

  private let result: Result<Void, MarkdownContentBuilderError>

  internal init(_ result: Result<Void, MarkdownContentBuilderError>) {
    self.result = result
  }

  internal func content(
    from _: SourceType,
    using _: @escaping (String) throws -> String
  ) throws -> String {
    isContentCalled = true

    switch result {
    case .success:
      return "# markdown"
    case let .failure(failure):
      throw failure
    }
  }
}
