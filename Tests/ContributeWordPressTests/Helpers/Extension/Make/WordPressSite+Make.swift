import ContributeWordPress
import Foundation
import SyndiKit

extension WordPressSite {
  internal static func make(
    title: String = "Leo G Dion",
    link: URL = .diagramForGoalsLink,
    description: String? = nil,
    pubDate: Date? = nil,
    categories: [WordPressElements.Category] = [],
    tags: [WordPressElements.Tag] = [],
    baseSiteURL: URL? = nil,
    baseBlogURL _: URL? = nil,
    posts: [WordPressPost] = []
  ) throws -> WordPressSite {
    .init(
      title: title,
      link: link,
      posts: posts,
      description: description,
      pubDate: pubDate,
      categories: categories,
      tags: tags,
      baseSiteURL: baseSiteURL,
      baseBlogURL: baseSiteURL,
      assetURLRegex: try NSRegularExpression(
        pattern: "\(link)/\(WordPressSite.contentUploadsRelativePath)([^\"]+)"
      )
    )
  }
}
