import ContributeWordPress
import Foundation
import SyndiKit

extension Source {
  internal static func make(
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
