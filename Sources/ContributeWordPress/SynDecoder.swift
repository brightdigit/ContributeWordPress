import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension SynDecoder: WordPressDecoder {
  public func decodePosts(fromData data: Data, allowInvalidCharacters: Bool) throws -> [WordPressPost]? {
    let newData: Data
    if let text = String(bytes: data, encoding: .utf8)?.replacingOccurrences(of: "\u{10}", with: "").data(using: .utf8, allowLossyConversion: true), allowInvalidCharacters {
      newData = text
    } else {
      newData = data
    }

    let feed = try decode(newData)
    let rss = feed as? RSSFeed
    return rss?.channel.items.compactMap(\.wpPost)
  }
}
