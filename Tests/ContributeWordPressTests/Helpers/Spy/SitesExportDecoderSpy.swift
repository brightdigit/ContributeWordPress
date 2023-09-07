import ContributeWordPress
import Foundation

internal final class SitesExportDecoderSpy: SitesExportDecoder {
  internal private(set) var isCalled = false

  private let result: Result<Void, SitesExportDecoderError>

  internal init(_ result: Result<Void, SitesExportDecoderError>) {
    self.result = result
  }

  internal func sites(fromExportsAt _: URL) throws -> [SectionName: WordPressSite] {
    isCalled = true

    switch result {
    case .success:
      return ["blogs": try .leogdion()]

    case let .failure(failure):
      throw failure
    }
  }
}
