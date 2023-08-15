import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A typealias that represents the section name for the blog
public typealias SectionName = String

/// A protocol for decoding WordPress sites from exports.
public protocol SitesExportDecoder {
  /// Returns a dictionary of WordPress sites keyed by the filename of
  /// the export file as section name.
  ///
  /// - Parameter directoryURL: The URL of the directory containing the exports.
  /// - Returns: A dictionary of WordPress sites keyed by section name.
  /// - Throws: An error if sites couldn't be extracted from any of the export files.
  func sites(fromExportsAt directoryURL: URL) throws -> [SectionName: WordPressSite]
}
