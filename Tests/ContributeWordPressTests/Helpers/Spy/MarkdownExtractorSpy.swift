import Contribute
import ContributeWordPress
import Foundation

internal final class MarkdownExtractorSpy: MarkdownExtractor {
  internal typealias SourceType = Source

  internal private(set) var isCalled: Bool = false

  private let result: Result<Void, MarkdownExtractorError>

  internal init() {
    result = .success(())
  }

  internal init(_ result: Result<Void, MarkdownExtractorError>) {
    self.result = result
  }

  internal func markdown(
    from _: SourceType,
    using _: @escaping (String) throws -> String
  ) throws -> String {
    isCalled = true

    switch result {
    case .success:
      return "# markdown"
    case let .failure(failure):
      throw failure
    }
  }
}
