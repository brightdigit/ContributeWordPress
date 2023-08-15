import Foundation
import SyndiKit
import ContributeWordPress

extension Source {

  static func make(
    sectionName: String,
    post: WordPressPost,
    featuredImage: String? = nil,
    htmlFromPost: ((WordPressPost) -> String)? = nil
  ) -> Source {
    Source(
      sectionName: sectionName,
      post: post,
      featuredImage: featuredImage,
      htmlFromPost: htmlFromPost
    )
  }
}
