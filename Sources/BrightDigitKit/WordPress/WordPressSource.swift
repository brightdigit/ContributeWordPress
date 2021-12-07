import Foundation
import SyndiKit

public struct WordPressSource {
  let sectionName: String
  let post: WordPressPost
  let featuredImage: String?
}

extension WordPressSource: HTMLSource {
  public var html: String {
    post.body
  }
}
