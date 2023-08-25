import Foundation
import SyndiKit

extension RSSItemCategory: Equatable {
  public static func == (lhs: RSSItemCategory, rhs: RSSItemCategory) -> Bool {
    lhs.value == rhs.value
    && lhs.domain == rhs.domain
    && lhs.nicename == rhs.nicename
  }

  internal static let TopMenu: Self = .init(
    value: "Top Menu",
    domain: "nav_menu",
    nicename: "top-menu"
  )

  internal static let Primary: Self = .init(
    value: "Primary",
    domain: "nav_menu",
    nicename: "primary"
  )

  internal static let Uncategorized: Self = .init(
    value: "Uncategorized",
    domain: "category",
    nicename: "uncategorized"
  )

  internal static let Podcasting: Self = .init(
    value: "Podcasting",
    domain: "post_tag",
    nicename: "podcasting"
  )

  internal static let Software: Self = .init(
    value: "Software",
    domain: "post_tag",
    nicename: "software"
  )

  internal static let Productivity: Self = .init(
    value: "Productivity",
    domain: "post_tag",
    nicename: "productivity"
  )
}
