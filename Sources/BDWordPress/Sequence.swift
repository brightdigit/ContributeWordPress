import SyndiKit

extension Sequence {
  func postSatisfiesAll(_ post: WordPressPost) -> Bool where Element == PostFilter {
    allSatisfy {
      $0.include(post)
    }
  }
}
