import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public struct FileURLDownloader: URLDownloader {
  init(session: URLSession = .shared, fileManager: FileManager = .default) {
    self.session = session
    self.fileManager = fileManager
  }

  let session: URLSession
  let fileManager: FileManager

  public func download(from fromURL: URL, to toURL: URL, _ completion: @escaping (Error?) -> Void) {
    let task = session.downloadTask(with: fromURL) { destination, _, error in
      var resultError: Error?
      if let error = error {
        resultError = error
      } else if let sourceURL = destination {
        do {
          try self.fileManager.createDirectory(at: toURL.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
          try self.fileManager.copyItem(at: sourceURL, to: toURL)
        } catch {
          resultError = error
        }
      }
      completion(resultError)
    }
    task.resume()
  }
}
