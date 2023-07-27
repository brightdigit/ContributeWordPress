import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that formats redirects in the way Netlify can understand it.
public struct NetlifyRedirectFormatter: RedirectFormatter {
  /// Formats the given redirect items into a string representation.
  ///
  /// - Parameter redirects: An array of `RedirectItem` representing the redirects.
  /// - Returns: A string representation of the formatted redirects.
  public func formatRedirects(_ redirects: [RedirectItem]) -> String {
    redirects
      .map { [$0.fromURLPath, $0.redirectURLPath].joined(separator: "\t") }
      .joined(separator: "\n")
  }

  /// Returns the URL where the redirect file should be written based on
  /// the resources directory URL.
  ///
  /// - Parameter resourcesDirURL: The resources directory URL.
  /// - Returns: The URL where the redirect file should be written.
  public func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL {
    resourcesDirURL.appendingPathComponent("_redirects")
  }
}
