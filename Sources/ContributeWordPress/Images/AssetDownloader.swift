import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that downloads assets required by WordPress posts.
public struct AssetDownloader: Downloader {
  private let urlDownloader: URLDownloader

  public init(
    urlDownloader: URLDownloader = FileURLDownloader()
  ) {
    self.urlDownloader = urlDownloader
  }

  /// Downloads assets using `URLDownloader`.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - dryRun: To perform a dry run without actually downloading the assets.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: An `ImportError.assetDownloads` error if there are any errors happened.
  public func download(
    assets: [AssetImport],
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws {
    guard !dryRun else {
      return
    }

    try downloadUsingGroupDispatch(
      assets: assets,
      allowsOverwrites: allowsOverwrites
    ) { errors in
      guard errors.isEmpty else {
        throw WordPressError.assetDownloadErrors(errors)
      }
    }
  }

  /// A helper function to download assets using DispatchGroup.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  ///   - completion: A completion handler called with errors mapped to asset source url.
  private func downloadUsingGroupDispatch(
    assets: [AssetImport],
    allowsOverwrites: Bool,
    completion: (_ errors: [URL: Error]) throws -> Void
  ) throws {
    var errors = [URL: Error]()

    let group = DispatchGroup()

    for asset in assets {
      group.enter()

      urlDownloader.download(
        from: asset.fromURL,
        to: asset.atURL,
        allowOverwrite: allowsOverwrites
      ) { error in
        if let error = error {
          errors[asset.fromURL] = error
        }
        group.leave()
      }
    }

    group.wait()

    try completion(errors)
  }
}
