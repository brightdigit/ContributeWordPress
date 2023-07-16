import SyndiKit

extension Sequence {
  /// Checks if the given WordPress post satisfy all post filters in current sequence.
  ///
  /// - Parameter post: The WordPress post to check.
  /// - Returns: `true` if the post satisfy all filters, `false` otherwise.
  internal func postSatisfiesAll(
    _ post: WordPressPost
  ) -> Bool where Element == PostFilter {
    allSatisfy {
      $0.include(post)
    }
  }
}
