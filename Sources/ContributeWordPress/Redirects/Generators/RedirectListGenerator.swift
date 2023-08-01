import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol for generating redirect items from WordPress posts.
public protocol RedirectListGenerator {
  /// Generates redirects list from the given WordPress posts.
  ///
  /// - Parameter allPosts: A dictionary of WordPress posts keyed by section name.
  /// - Returns: An array of `RedirectItem` representing the redirects.
  func redirects(
    fromWordPressPosts allPosts: [SectionName: WordPressSite]
  ) -> [RedirectItem]
}
