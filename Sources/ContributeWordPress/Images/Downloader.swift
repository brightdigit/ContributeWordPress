import Foundation
import SyndiKit

/// A protocol for downloading asset imports.
public protocol Downloader {
  /// Downloads asset imports.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - dryRun: To perform a dry run without actually downloading the assets.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: An error if there are any errors happened.
  func download(
    assets: [AssetImport],
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws
}
