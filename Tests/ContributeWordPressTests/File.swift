import Foundation
import SyndiKit
@testable import ContributeWordPress

let item: RSSItem = .init(
    title: "diagram-for-goals",
    link: URL(string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/")!,
    description: "This is a description",
    guid: .url(URL(string: "https://leogdion.name/wp-content/uploads/2018/01/diagram-for-goals.png")!),
    pubDate: .distantPast,
    contentEncoded: .init(),
    categoryTerms: [.Uncategorized],
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
    creators: ["Shendy"],
    wpCommentStatus: .init(),
    wpPingStatus: .init(),
    wpStatus: .init(),
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
    wpPostType: "post",
    wpPostMeta: nil,
    wpAttachmentURL: nil,
    mediaContent: nil,
    mediaThumbnail: nil
)

internal extension WordPressElements.Category {
    static let TopMenu: Self = .TopMenu
}

internal extension RSSItemCategory {
    static let TopMenu: Self = .init(
        value: "Top Menu",
        domain: "nav_menu",
        nicename: "top-menu"
    )

    static let Primary: Self = .init(
        value: "Primary",
        domain: "nav_menu",
        nicename: "primary"
    )

    static let Uncategorized: Self = .init(
        value: "Uncategorized",
        domain: "category",
        nicename: "uncategorized"
    )

    static let Podcasting: Self = .init(
        value: "Podcasting",
        domain: "post_tag",
        nicename: "podcasting"
    )
}
