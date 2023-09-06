import ContributeWordPress
import Foundation

internal final class RedirectFileWriterSpy: RedirectFileWriter {
  internal private(set) var isCalled: Bool = false

  private let result: Result<Void, RedirectFileWriterError>

  internal init(_ result: Result<Void, RedirectFileWriterError>) {
    self.result = result
  }

  internal func writeRedirects(
    fromSites _: [SectionName: WordPressSite],
    inDirectory _: URL
  ) throws {
    isCalled = true

    switch result {
    case .success:
      // doing nothing
      break

    case let .failure(failure):
      throw failure
    }
  }
}
