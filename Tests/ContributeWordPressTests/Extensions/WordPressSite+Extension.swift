import Foundation
import SyndiKit
import ContributeWordPress

extension WordPressSite {
  internal static func leogdion() throws -> WordPressSite {
    try .make(
      title: "Leo G Dion",
      link: try .make(string: "https://leogdion.name"),
      description: "Personal Blog",
      categories: [.Uncategorized, .Podcasting, .Productivity, .Software],
      baseSiteURL: URL(string: "https://leogdion.name"),
      baseBlogURL: URL(string: "https://leogdion.name")
    )
  }
}

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
