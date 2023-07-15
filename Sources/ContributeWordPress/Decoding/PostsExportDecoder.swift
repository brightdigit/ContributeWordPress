import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol that defines the methods needed to decode WordPress posts
/// from the given directory.
public protocol PostsExportDecoder {
  /// Returns a dictionary of keys to lists of WordPress posts,
  /// where the keys are the names of the files in the given directory
  /// and the values are the lists of posts found in each file.
  ///
  /// - Parameter directoryURL: The URL of the directory containing the exports.
  /// - Returns: A dictionary of keys to lists of WordPress posts, or `nil` if the directory could not be read.
  func posts(fromExportsAt directoryURL: URL) throws -> [String: [WordPressPost]]
}
