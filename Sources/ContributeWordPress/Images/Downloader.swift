import Foundation
import SyndiKit

/// A protocol for downloading assets from WordPress posts.
public protocol Downloader {
  /// Downloads assets.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - dryRun: To perform a dry run without actually downloading the assets.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: An error if there are any errors happened.
  func download(
    assets: [WordPressAssetImport],
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws
}
