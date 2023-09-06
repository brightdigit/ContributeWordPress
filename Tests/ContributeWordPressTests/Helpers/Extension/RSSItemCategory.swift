import Foundation
import SyndiKit

extension RSSItemCategory: Equatable {
  public static func == (lhs: RSSItemCategory, rhs: RSSItemCategory) -> Bool {
    lhs.value == rhs.value
      && lhs.domain == rhs.domain
      && lhs.nicename == rhs.nicename
  }
}
