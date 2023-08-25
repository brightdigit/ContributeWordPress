import Foundation

final class FileURLFromDirectorySpy {
  var fromDirectoryIsCalled: Bool = false

  private let result: Result<Void, SitesExportSynDecoderError>

  init(_ result: Result<Void, SitesExportSynDecoderError>) {
    self.result = result
  }

  func fileURLsFromDirectory(_ directory: URL) throws -> [URL] {
    fromDirectoryIsCalled = true

    switch result {
    case .success:
      return []
    case .failure(let failure):
      throw failure
    }
  }
}
