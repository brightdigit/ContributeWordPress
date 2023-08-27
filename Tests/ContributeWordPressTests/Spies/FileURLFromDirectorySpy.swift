import Foundation

internal final class FileURLFromDirectorySpy {
  internal var fromDirectoryIsCalled: Bool = false

  private let result: Result<Void, SitesExportSynDecoderError>

  internal init(_ result: Result<Void, SitesExportSynDecoderError>) {
    self.result = result
  }

  internal func fileURLsFromDirectory(_: URL) throws -> [URL] {
    fromDirectoryIsCalled = true

    switch result {
    case .success:
      return []

    case let .failure(failure):
      throw failure
    }
  }
}
