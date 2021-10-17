import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension SynDecoder: WordPressDecoder {
  public func decodePosts(fromData data: Data) throws -> [WordPressPost]? {
    let feed = try decode(data)
    let rss = feed as? RSSFeed
    return rss?.channel.items.compactMap(\.wpPost)
  }
}
