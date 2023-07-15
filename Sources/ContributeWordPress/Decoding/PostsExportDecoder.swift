import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol that defines the methods needed to decode WordPress posts.
public protocol PostsExportDecoder {
  /// Returns a dictionary of WordPress posts keyed by the filename of
  /// the export file containing them.
  ///
  /// The keys will be the filename of WordPress exports in the given directory,
  /// which later will be a section id for the website. The values are the lists of posts
  /// found in each export file to be displayed under each section id.
  ///
  /// - Parameter directoryURL: The URL of the directory containing the exports.
  /// - Returns: A dictionary of keys to lists of WordPress posts.
  /// - Throws: An error if posts couldn't be extracted from any of the export files.
  func posts(fromExportsAt directoryURL: URL) throws -> [String: [WordPressPost]]
}
