import Contribute
import ContributeWordPress
import Foundation

/// `URLDownloader` is `Sendable`, so this spy has to be too. Downloading is
/// `async`, so the recorded call flag lives in an actor rather than behind a
/// lock — actor isolation provides the synchronization the `NSLock` used to.
internal actor FileDownloaderSpy: URLDownloader {
  internal private(set) var downloadIsCalled = false

  private let result: Result<Void, DownloadError>

  internal init(_ result: Result<Void, DownloadError>) {
    self.result = result
  }

  internal func download(
    from _: URL,
    to toURL: URL,
    allowOverwrite _: Bool
  ) async throws {
    self.downloadIsCalled = true

    switch result {
    case .success:
      break

    case .failure(let failure):
      throw WordPressError.assetDownloadErrors([toURL: failure])
    }
  }
}
