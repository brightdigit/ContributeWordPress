import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct ImageDownloader: Downloader {
  let downloadPathFromURL: (URL) -> String = Self.defaultDownloadPath(fromURL:)
  let downloadURLFromURL: (URL) -> URL? = Self.defaultDownloadURL(fromURL:)
  let urlDownloader: URLDownloader = FileURLDownloader()

  static func defaultDownloadPath(fromURL url: URL) -> String {
    let directoryPrefix = url.host?.components(separatedBy: ".").first ?? "default"
    return ([directoryPrefix] + url.pathComponents.suffix(3)).joined(separator: "/")
  }

  static func defaultDownloadURL(fromURL url: URL) -> URL? {
    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
      return nil
    }
    components.query = nil
    return components.url
  }

  public func download(fromPosts posts: [WordPressPost], to resourceImagePath: URL) throws {
    let imageURLs: Set<URL> = Set(posts.filter {
      $0.type == "attachment"
    }.compactMap(\.attachmentURL)
    )

    let imagePaths: [URL: String] = imageURLs.map { url in
      let path = self.downloadPathFromURL(url)
      let url = self.downloadURLFromURL(url) ?? url
      return (url, path)
    }.uniqueByKey()

    let group = DispatchGroup()

    var errors = [URL: Error]()

    for (url, path) in imagePaths {
      group.enter()
      let destinationURL = resourceImagePath.appendingPathComponent(path)
      urlDownloader.download(from: url, to: destinationURL) { error in
        if let error = error {
          errors[url] = error
        }
        group.leave()
      }
    }

    group.wait()

    guard errors.isEmpty else {
      throw ImportError.imageDownloads(errors)
    }
  }
}
