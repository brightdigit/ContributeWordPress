import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that downloads assets required by WordPress posts.
public struct AssetDownloader: Downloader {
  private let downloadPathFromURL: (URL) -> String
  private let downloadURLFromURL: (URL) -> URL?
  private let urlDownloader: URLDownloader

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

  init(
    downloadPathFromURL: @escaping (URL) -> String = Self.defaultDownloadPath(fromURL:),
    downloadURLFromURL: @escaping (URL) -> URL? = Self.defaultDownloadURL(fromURL:),
    urlDownloader: URLDownloader = FileURLDownloader()
  ) {
    self.downloadPathFromURL = downloadPathFromURL
    self.downloadURLFromURL = downloadURLFromURL
    self.urlDownloader = urlDownloader
  }

  /// Downloads assets from WordPress posts.
  ///
  /// - Parameters:
  ///   - assets: The array of imported assets to be downloaded.
  ///   - resourceImagePath: The directory path where the downloaded assets will be saved.
  ///   - dryRun: To perform a dry run without actually downloading the assets.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: An `ImportError.assetDownloads` error if there are any errors during
  ///           the download process.
  public func download(
    assets: [WordPressAssetImport],
    to resourceImagePath: URL,
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws {
    guard !dryRun else {
      return
    }

    let group = DispatchGroup()

    var errors = [URL: Error]()

    for asset in assets {
      group.enter()

      let fromURL = self.downloadURLFromURL(asset.oldURL) ?? asset.oldURL
      let newPath = self.downloadPathFromURL(asset.oldURL)

      let destinationURL = resourceImagePath.appendingPathComponent(newPath)

      urlDownloader.download(
        from: fromURL,
        to: destinationURL,
        allowOverwrite: allowsOverwrites
      ) { error in
        if let error = error {
          errors[asset.oldURL] = error
        }
        group.leave()
      }
    }

    group.wait()

    guard errors.isEmpty else {
      throw ImportError.assetDownloads(errors)
    }
  }

}
