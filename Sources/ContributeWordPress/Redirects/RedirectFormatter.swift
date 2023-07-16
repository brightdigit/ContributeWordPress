import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol for formatting redirects.
public protocol RedirectFormatter {
  /// Formats the given redirect items into a string representation.
  ///
  /// - Parameter redirects: An array of `RedirectItem` representing the redirects.
  /// - Returns: A string representation of the formatted redirects.
  func formatRedirects(_ redirects: [RedirectItem]) -> String

  /// Returns the URL where the redirect file should be written based on
  /// the resources directory URL.
  ///
  /// - Parameter resourcesDirURL: The resources directory URL.
  /// - Returns: The URL where the redirect file should be written.
  func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL
}
