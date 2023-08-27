import Foundation
import Contribute
import ContributeWordPress

internal final class FileDownloaderSpy: URLDownloader {
  internal var downloadIsCalled: Bool = false

  private let result: Result<Void, DownloadError>

  init(_ result: Result<Void, DownloadError>) {
    self.result = result
  }

  internal func download(
    from fromURL: URL,
    to toURL: URL,
    allowOverwrite: Bool,
    _ completion: @escaping (Error?) -> Void
  ) {
    downloadIsCalled = true

    switch result {
    case .success:
      completion(nil)
    case .failure(let failure):
      completion(WordPressError.assetDownloadErrors([toURL : failure]))
    }
  }
}
