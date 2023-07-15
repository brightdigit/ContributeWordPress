import Foundation
import SyndiKit

/// A protocol that defines a filter to be used to include or exclude WordPress posts.
public protocol PostFilter {
  /// Determines whether a WordPress post meets the criteria defined by the filter.
  ///
  /// - Parameters:
  ///   - post: The WordPressPost object being evaluated.
  /// - Returns: A boolean value indicating whether the post meets the criteria
  ///            defined by the filter or not.
  func include(_ post: WordPressPost) -> Bool
}
