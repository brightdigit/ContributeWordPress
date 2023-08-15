import SyndiKit

extension Sequence {
  /// Checks if the given WordPress post satisfies all the filters in the sequence.
  ///
  /// - Parameter post: The `WordPressPost` to be checked.
  /// - Returns: `true` if the post satisfies all the filters, `false` otherwise.
  internal func postSatisfiesAll(
    _ post: WordPressPost
  ) -> Bool where Element == PostFilter {
    allSatisfy {
      $0.include(post)
    }
  }
}
