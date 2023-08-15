import Foundation
import SyndiKit

/// A protocol for writing redirect items for each post of the WordPress sites.
public protocol RedirectFileWriter {
  /// Generates redirects list for each post of the WordPress sites, then writes them
  /// into a file at the given directory.
  ///
  /// - Parameters:
  ///   - sites: A dictionary of WordPress sites keyed by section name.
  ///   - directoryURL: The directory URL where the redirects file should be written.
  /// - Throws: An error if the writing operation fails.
  func writeRedirects(
    fromSites sites: [SectionName: WordPressSite],
    inDirectory directoryURL: URL
  ) throws
}
