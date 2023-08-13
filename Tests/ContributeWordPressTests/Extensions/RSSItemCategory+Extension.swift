import Foundation
import SyndiKit

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

    static let Software: Self = .init(
        value: "Software",
        domain: "post_tag",
        nicename: "software"
    )

    static let Productivity: Self = .init(
        value: "Productivity",
        domain: "post_tag",
        nicename: "productivity"
    )
}
