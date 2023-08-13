import Foundation
import SyndiKit
import ContributeWordPress

extension WordPressSite {
    static func make(
        title: String = "Leo G Dion",
        link: URL = .diagramForGoalsLink,
        description: String? = nil,
        pubDate: Date = Date(),
        categories: [RSSItemCategory] = [.Uncategorized],
        tags: [WordPressElements.Tag] = [],
        baseSiteURL: URL? = nil,
        baseBlogURL: URL? = nil,
        posts: [WordPressPost] = [],
        assetURLRegex: NSRegularExpression? = nil
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
            assetURLRegex: try (assetURLRegex ?? .init(pattern: "---"))
        )
    }
}
