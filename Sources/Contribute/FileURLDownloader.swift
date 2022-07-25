import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public struct FileURLDownloader: URLDownloader {
  public init(session: URLSession = .shared, fileManager: FileManager = .default) {
    self.session = session
    self.fileManager = fileManager
  }

  let session: URLSession
  let fileManager: FileManager

  public func download(from fromURL: URL, to toURL: URL, allowOverwrite: Bool, _ completion: @escaping (Error?) -> Void) {
    let task = session.downloadTask(with: fromURL) { destination, _, error in
      var resultError: Error?
      if let error = error {
        resultError = error
      } else if let sourceURL = destination {
        do {
          try self.fileManager.createDirectory(at: toURL.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
          if self.fileManager.fileExists(atPath: toURL.path) {
            if allowOverwrite {
              _ = try self.fileManager.replaceItemAt(toURL, withItemAt: sourceURL)
            }
          } else {
            try self.fileManager.copyItem(at: sourceURL, to: toURL)
          }
        } catch {
          resultError = error
        }
      }
      completion(resultError)
    }
    task.resume()
  }
}
