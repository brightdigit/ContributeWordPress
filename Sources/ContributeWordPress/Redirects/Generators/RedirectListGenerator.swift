import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol for generating redirect items for each post of WordPress sites.
public protocol RedirectListGenerator {
  /// Generates redirects list for each post of the given WordPress sites.
  ///
  /// - Parameter sites: A dictionary of WordPress sites keyed by section name.
  /// - Returns: An array of `RedirectItem` representing the redirects.
  func redirects(
    fromSites sites: [SectionName: WordPressSite]
  ) -> [RedirectItem]
}
