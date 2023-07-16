import SyndiKit

/// A protocol used as filter condition to include/exclude specific WordPress post
/// in/from redirects list.
public protocol PostFilter {
  /// Determines whether a WordPress post meets the criteria defined by the filter.
  ///
  /// - Parameter post: The WordPress post being evaluated.
  /// - Returns: A boolean value indicating whether the post meets the criteria
  ///            defined by the filter.
  func include(_ post: WordPressPost) -> Bool
}
