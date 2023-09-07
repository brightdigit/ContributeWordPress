import Foundation

internal final class FileURLFromDirectorySpy {
  internal var fromDirectoryIsCalled = false

  private let result: Result<Void, SitesExportDecoderError>

  internal init(_ result: Result<Void, SitesExportDecoderError>) {
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
