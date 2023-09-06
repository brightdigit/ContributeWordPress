import Contribute
import ContributeWordPress
import Foundation

internal final class FrontMatterExporterSpy: FrontMatterExporter {
  internal typealias SourceType = Source

  internal private(set) var isCalled: Bool = false

  private let result: Result<Void, FrontMatterExporterError>

  internal init(_ result: Result<Void, FrontMatterExporterError>) {
    self.result = result
  }

  internal func frontMatterText(from _: Source) throws -> String {
    isCalled = true

    switch result {
    case .success:
      return "# markdown"
    case let .failure(failure):
      throw failure
    }
  }
}
