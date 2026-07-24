import ContributeWordPress
import Foundation

/// `Downloader` is `Sendable`, and downloading is `async`, so the recorded call
/// flag is protected by actor isolation.
internal actor AssetDownloaderSpy: Downloader {
  internal private(set) var isCalled = false

  private let result: Result<Void, AssetDownloaderError>

  internal init(_ result: Result<Void, AssetDownloaderError>) {
    self.result = result
  }

  internal func download(assets _: [AssetImport], allowsOverwrites _: Bool) async throws {
    isCalled = true

    switch result {
    case .success:
      break

    case .failure(let failure):
      throw failure
    }
  }
}
