import Contribute
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

  public func download(fromPosts posts: [WordPressPost], to resourceImagePath: URL, dryRun: Bool, allowsOverwrites: Bool) throws -> [WordPressImageImport] {
    let imagePosts = Set(posts.compactMap { post in
      WordPressImageImport(post: post, pathFromURL: self.downloadPathFromURL, urlFromURL: self.downloadURLFromURL)
    })

    guard !dryRun else {
      return .init(imagePosts)
    }

    let group = DispatchGroup()

    var errors = [URL: Error]()

    for image in imagePosts {
      group.enter()
      let destinationURL = resourceImagePath.appendingPathComponent(image.newPath)
      urlDownloader.download(from: image.oldURL, to: destinationURL, allowOverwrite: allowsOverwrites) { error in
        if let error = error {
          errors[image.oldURL] = error
        }
        group.leave()
      }
    }

    group.wait()

    guard errors.isEmpty else {
      throw ImportError.imageDownloads(errors)
    }

    return .init(imagePosts)
  }
}
