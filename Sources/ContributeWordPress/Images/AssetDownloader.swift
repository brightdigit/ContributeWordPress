import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that downloads assets required by WordPress posts.
public struct AssetDownloader: Downloader {
  // swiftlint:disable:next line_length
  #warning("I'm not sure we gain anything by this abstraction. I'd combine FileURLDownloader with this type for now.")
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

    guard errors.isEmpty else {
      throw ImportError.assetDownloads(errors)
    }
  }
}
