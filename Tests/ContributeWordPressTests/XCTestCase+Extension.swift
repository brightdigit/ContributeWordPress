import XCTest
import SyndiKit
@testable import ContributeWordPress

extension XCTestCase {
    static func myYearInReviewPost() throws -> WordPressPost {
        try makeWordPressPost(
            title: "2018 - My Year in Review",
            description: "My main goal this year was to produce more content online and less time on local events and gatherings. Unfortunately, that wasn't the case."
        )
    }

    static func areWeThereYetPost() throws -> WordPressPost {
        try makeWordPressPost(
            title: "Are We There Yet?"
        )
    }

    static func fromGoalsToActionsPost() throws -> WordPressPost {
        try makeWordPressPost(
            title: "From Goals to Actions 2018"
        )
    }

    static func podcastingPost() throws -> WordPressPost {
        try makeWordPressPost(
            title: "Podcasting - Getting Started - Whys and Hows",
            description: "Generally speaking, podcasting gives specific audiences an in-depth specialized analysis without the need to appeal to the general audience."
        )
    }

    static func productivityAppsPost() throws -> WordPressPost {
        try makeWordPressPost(
            title: "Productivity Apps for Developers (and Everyone Else)",
            description: "It's important to keep a set of great productivity app which help me optimize rather than distract. Here's a list of productivity apps and services to help you."
        )
    }

    static func makeWordPressSite(
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

    static func makeWordPressPost(
        title: String,
        link: URL = .diagramForGoalsLink,
        description: String? = nil,
        guid: EntryID = .diagramForGoalsEntryID,
        type: String = "post",
        pubDate: Date = Date(),
        categories: [RSSItemCategory] = [.Uncategorized],
        status: String = "publish"
    ) throws -> WordPressPost {
        try .init(
            item: makeRSSItem(
                title: title,
                link: link,
                description: description,
                guid: guid,
                type: type,
                pubDate: pubDate,
                categories: categories,
                status: status
            )
        )
    }

    private static func makeRSSItem(
        title: String,
        link: URL = .diagramForGoalsLink,
        description: String? = nil,
        guid: EntryID = .diagramForGoalsEntryID,
        type: String = "post",
        pubDate: Date = Date(),
        categories: [RSSItemCategory] = [.Uncategorized],
        status: String = "publish"
    ) -> RSSItem {
        .init(
            title: title,
            link: link,
            description: description,
            guid: guid,
            pubDate: pubDate,
            contentEncoded: .init(),
            categoryTerms: categories,
            content: .init(),
            itunesTitle: "itunes Title",
            itunesEpisode: .init(10),
            itunesAuthor: "itunesAuthor",
            itunesSubtitle: "itunesSubtitle",
            itunesSummary: "itunesSummary",
            itunesExplicit: "itunesExplicit",
            itunesDuration: 10,
            itunesImage: nil,
            enclosure: nil,
            creators: ["First Creator"],
            wpCommentStatus: .init(),
            wpPingStatus: .init(),
            wpStatus: status,
            wpPostParent: .bitWidth,
            wpMenuOrder: .bitWidth,
            wpIsSticky: .bitWidth,
            wpPostPassword: .init(),
            wpPostID: 10,
            wpPostDate: .distantPast,
            wpPostDateGMT: .distantFuture,
            wpModifiedDate: .distantFuture,
            wpModifiedDateGMT: nil,
            wpPostName: .init(),
            wpPostType: type,
            wpPostMeta: nil,
            wpAttachmentURL: nil,
            mediaContent: nil,
            mediaThumbnail: nil
        )
    }
}

extension URL {
    static let diagramForGoalsLink: URL =  .init(
        string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/"
    )!
}

extension EntryID {
    static let diagramForGoalsEntryID: EntryID = .url(.diagramForGoalsLink)
}
