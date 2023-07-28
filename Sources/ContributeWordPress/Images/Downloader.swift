import Foundation
import SyndiKit

/// A protocol for downloading assets from WordPress posts.
public protocol Downloader {
//  func download(
//    assets: [WordPressAssetImport],
//    to resourceAssetPath: URL,
//    dryRun: Bool,
//    allowsOverwrites: Bool
//  ) throws

  func download(
    assets: [WordPressAssetImport],
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws
}
