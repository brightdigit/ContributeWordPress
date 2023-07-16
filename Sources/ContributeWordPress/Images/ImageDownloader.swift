import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that downloads images required by WordPress posts.
public struct ImageDownloader: Downloader {
  private let downloadPathFromURL: (URL) -> String = Self.defaultDownloadPath(fromURL:)
  private let downloadURLFromURL: (URL) -> URL? = Self.defaultDownloadURL(fromURL:)
  private let urlDownloader: URLDownloader = FileURLDownloader()

  private static func defaultDownloadPath(fromURL url: URL) -> String {
    let directoryPrefix = url.host?.components(separatedBy: ".").first ?? "default"
    return ([directoryPrefix] + url.pathComponents.suffix(3)).joined(separator: "/")
  }

  private static func defaultDownloadURL(fromURL url: URL) -> URL? {
    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
      return nil
    }
    components.query = nil
    return components.url
  }

  /// Downloads images from WordPress posts.
  ///
  /// - Parameters:
  ///   - posts: The array of WordPress posts from which to download images.
  ///   - resourceImagePath: The directory path where the downloaded images will be saved.
  ///   - dryRun: To perform a dry run without actually downloading the images.
  ///   - allowsOverwrites: To allow overwriting existing images.
  /// - Returns: An array of `WordPressImageImport` objects, one for each image that
  ///            was downloaded.
  /// - Throws: An `ImportError.imageDownloads` error if there are any errors during
  ///           the image download process.
  public func download(
    fromPosts posts: [WordPressPost],
    to resourceImagePath: URL,
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws -> [WordPressImageImport] {
    let imagePosts = Set(posts.compactMap { post in
      WordPressImageImport(
        post: post,
        newPathFromURL: self.downloadPathFromURL,
        oldURLFromURL: self.downloadURLFromURL
      )
    })

    guard !dryRun else {
      return .init(imagePosts)
    }

    let group = DispatchGroup()

    var errors = [URL: Error]()

    for image in imagePosts {
      group.enter()
      let destinationURL = resourceImagePath.appendingPathComponent(image.newPath)
      urlDownloader.download(
        from: image.oldURL,
        to: destinationURL,
        allowOverwrite: allowsOverwrites
      ) { error in
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
