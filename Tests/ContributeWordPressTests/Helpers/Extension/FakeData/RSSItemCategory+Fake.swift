import Foundation
import SyndiKit

extension RSSItemCategory {
  internal static let topMenu: Self = .init(
    value: "Top Menu",
    domain: "nav_menu",
    nicename: "top-menu"
  )

  internal static let primary: Self = .init(
    value: "Primary",
    domain: "nav_menu",
    nicename: "primary"
  )

  internal static let uncategorized: Self = .init(
    value: "Uncategorized",
    domain: "category",
    nicename: "uncategorized"
  )

  internal static let podcasting: Self = .init(
    value: "Podcasting",
    domain: "post_tag",
    nicename: "podcasting"
  )

  internal static let software: Self = .init(
    value: "Software",
    domain: "post_tag",
    nicename: "software"
  )

  internal static let productivity: Self = .init(
    value: "Productivity",
    domain: "post_tag",
    nicename: "productivity"
  )
}
