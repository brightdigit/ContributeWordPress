import SyndiKit
extension Array {
  static func combine(_ lhs: Self?, _ rhs: Self?) -> Self? {
    guard let lhs = lhs else {
      return rhs
    }

    guard let rhs = rhs else {
      return lhs
    }

    return lhs + rhs
  }

//  func postSatisfiesAll(_ post: WordPressPost) -> Bool where Element == PostFilter {
//    allSatisfy {
//      $0.include(post)
//    }
//  }
}
