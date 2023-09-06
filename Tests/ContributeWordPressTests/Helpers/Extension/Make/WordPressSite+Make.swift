import ContributeWordPress
import Foundation
import SyndiKit

extension WordPressSite {
  internal static func make(
    title: String = "Leo G Dion",
    link: URL = .diagramForGoalsLink,
    description: String? = nil,
    pubDate: Date = Date(),
    categories _: [RSSItemCategory] = [.Uncategorized],
    tags: [WordPressElements.Tag] = [],
    baseSiteURL: URL? = nil,
    baseBlogURL _: URL? = nil,
    posts: [WordPressPost] = []
  ) throws -> WordPressSite {
    .init(
      title: title,
      link: link,
      description: description,
      pubDate: pubDate,
      categories: [.TopMenu],
      tags: tags,
      baseSiteURL: baseSiteURL,
      baseBlogURL: baseSiteURL,
      posts: posts,
      assetURLRegex: try NSRegularExpression(
        pattern: "\(link)/\(WordPressSite.contentUploadsRelativePath)([^\"]+)"
      )
    )
  }
}
