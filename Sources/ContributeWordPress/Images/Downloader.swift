import Foundation
import SyndiKit

/// A protocol for downloading assets from WordPress posts.
public protocol Downloader {
  func download(
    assets: [WordPressAssetImport],
    to resourceImagePath: URL,
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws
}
