import Contribute
import ContributeWordPress
import Foundation

internal final class FileDownloaderSpy: URLDownloader {
  internal var downloadIsCalled: Bool = false

  private let result: Result<Void, DownloadError>

  internal init(_ result: Result<Void, DownloadError>) {
    self.result = result
  }

  internal func download(
    from _: URL,
    to toURL: URL,
    allowOverwrite _: Bool,
    _ completion: @escaping (Error?) -> Void
  ) {
    downloadIsCalled = true

    switch result {
    case .success:
      completion(nil)

    case let .failure(failure):
      completion(WordPressError.assetDownloadErrors([toURL: failure]))
    }
  }
}
