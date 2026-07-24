import Contribute
import ContributeWordPress
import Foundation

/// `URLDownloader` is `Sendable`, so this spy has to be too. The only mutable
/// state is the recorded call flag, and it is only ever touched through
/// ``downloadIsCalled``/``recordDownload()``, which hold `lock` for the whole
/// access. `Synchronization.Mutex` would express that in the type system, but it
/// needs macOS 15 / iOS 18 and this package supports iOS 16 / watchOS 9, so the
/// lock is external and `downloadWasCalled` is marked `nonisolated(unsafe)`.
internal final class FileDownloaderSpy: URLDownloader, Sendable {
  internal var downloadIsCalled: Bool {
    self.lock.lock()
    defer { self.lock.unlock() }
    return self.downloadWasCalled
  }

  private let lock = NSLock()
  nonisolated(unsafe) private var downloadWasCalled = false

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
    self.recordDownload()

    switch result {
    case .success:
      completion(nil)

    case .failure(let failure):
      completion(WordPressError.assetDownloadErrors([toURL: failure]))
    }
  }

  private func recordDownload() {
    self.lock.lock()
    defer { self.lock.unlock() }
    self.downloadWasCalled = true
  }
}
