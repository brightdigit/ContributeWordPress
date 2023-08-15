import SyndiKit

/// A protocol used as a filter condition to include or exclude specific WordPress post.
public protocol PostFilter {
  /// Determines whether a WordPress post meets the criteria defined by the filter.
  ///
  /// - Parameter post: The WordPress post being evaluated.
  /// - Returns: A boolean value indicating whether the post meets the criteria
  ///            defined by the filter.
  func include(_ post: WordPressPost) -> Bool
}

private enum PostFilters {
  // swiftlint:disable:next force_try
  static let `default` = try! [
    RegexKeyPostFilter(pattern: "post", keyPath: \.type),
    RegexKeyPostFilter(pattern: "publish", keyPath: \.status)
  ]
}

extension Array where Element == PostFilter {
  /// Default post filters for published posts.
  public static var `default`: Self {
    PostFilters.default
  }
}
