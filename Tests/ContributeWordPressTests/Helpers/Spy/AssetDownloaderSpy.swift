import ContributeWordPress
import Foundation

internal final class AssetDownloaderSpy: Downloader {
  internal private(set) var isCalled: Bool = false

  private let result: Result<Void, AssetDownloaderError>

  internal init(_ result: Result<Void, AssetDownloaderError>) {
    self.result = result
  }

  internal func download(assets _: [AssetImport], allowsOverwrites _: Bool) throws {
    isCalled = true

    switch result {
    case .success:
      break

    case let .failure(failure):
      throw failure
    }
  }
}
