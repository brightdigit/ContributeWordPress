import Foundation
import Plot
import Publish

enum ArticlePostable: Postable {
  static let sectionH1 = "Latest Articles"

  static let sectionTitle = "Articles – Practical Advice and Tips on App Development and all things Apple"
  static let sectionDescription = "Check out our articles for advice and learn about the latest on Swift App Development, App project management, and the latest developments in the world of Apple."

  static let twitterSource = "brightdigit"
}

extension Postable {
  static var linkedInSource: String {
    "brightdigit.com"
  }
}

typealias ArticleItem = PostItem<ArticlePostable>
