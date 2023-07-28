// swiftlint:disable function_body_length
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

  /// Downloads assets.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - dryRun: To perform a dry run without actually downloading the assets.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: An `ImportError.assetDownloads` error if there are any errors during
  public func download(
    assets: [WordPressAssetImport],
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

      urlDownloader.download(
        from: asset.downloadFromURL,
        to: asset.downloadAtURL,
        allowOverwrite: allowsOverwrites
      ) { error in
        if let error = error {
          errors[asset.downloadFromURL] = error
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
