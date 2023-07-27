import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif


// @Leo, I just used this instead, it makes the dictionary more clear
// do you have any idea where to put this?
public typealias SectionName = String

/// A protocol for decoding WordPress posts from exports.
public protocol PostsExportDecoder {
  /// Returns a dictionary of WordPress posts keyed by the filename of
  /// the export file as section name.
  ///
  /// - Parameter directoryURL: The URL of the directory containing the exports.
  /// - Returns: A dictionary of WordPress posts keyed by section name.
  /// - Throws: An error if posts couldn't be extracted from any of the export files.
  func posts(fromExportsAt directoryURL: URL) throws -> [SectionName: [WordPressPost]]
}
