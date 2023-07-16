import Foundation
import SyndiKit

/// A protocol for downloading resources from WordPress posts.
public protocol Downloader {
  /// Downloads images from the given posts to the given resource image path.
  ///
  /// - Parameters:
  ///   - posts: The WordPress posts to download images from.
  ///   - resourcePath: The path to where the downloaded images will be saved.
  ///   - dryRun: Whether to download the images.
  ///   - allowsOverwrites: Whether to overwrite existing images.
  /// - Returns: An array of `WordPressImageImport` objects,
  ///            one for each post image.
  func download(
    fromPosts posts: [WordPressPost],
    to resourceImagePath: URL,
    dryRun: Bool,
    allowsOverwrites: Bool
  ) throws -> [WordPressImageImport]
}
