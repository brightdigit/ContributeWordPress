import Foundation
import SyndiKit

extension NSRegularExpression {
  internal func matchUrls(
    in posts: [WordPressPost]
  ) -> [(sourceURL: URL, post: WordPressPost)] {
    posts
      .flatMap { post in
        self
          .matches(
            in: post.body,
            range: NSRange(post.body.startIndex..., in: post.body)
          )
          .compactMap { match in
            guard let range = Range(match.range, in: post.body) else {
              return nil
            }

            guard let url = URL(string: String(post.body[range])) else {
              return nil
            }

            return (sourceURL: url, post: post)
          }
      }
  }
}
