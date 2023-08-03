import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// An extension that enables SynDecoder to decode WordPress posts.
extension SynDecoder: WordPressDecoder {
  public func decodePosts(
    fromData data: Data,
    allowInvalidCharacters: Bool
  ) throws -> WordPressSite? {
    let text = String(bytes: data, encoding: .utf8)?
      .replacingOccurrences(of: "\u{10}", with: "")
      .data(using: .utf8, allowLossyConversion: true)

    let newData: Data
    if let text = text, allowInvalidCharacters {
      newData = text
    } else {
      newData = data
    }

    let feed = try decode(newData)
    let rss = feed as? RSSFeed
    return try rss.map(\.channel).map(WordPressSite.init)
  }

  /// Decodes an array of WordPress posts from the given data.
  ///
  /// - Parameters:
  ///   - data: The data to decode.
  ///   - allowInvalidCharacters: Whether to allow invalid characters in decoded data.
  /// - Returns: An array of WordPress posts, or nil if decoding failed.
  /// - Throws: An error if data couldn't be decoded.
  public func decodePosts(
    fromData data: Data,
    allowInvalidCharacters: Bool
  ) throws -> [WordPressPost]? {
    let text = String(bytes: data, encoding: .utf8)?
      .replacingOccurrences(of: "\u{10}", with: "")
      .data(using: .utf8, allowLossyConversion: true)

    let newData: Data
    if let text = text, allowInvalidCharacters {
      newData = text
    } else {
      newData = data
    }

    let feed = try decode(newData)
    let rss = feed as? RSSFeed
    return rss?.channel.items.compactMap(\.wpPost)
  }
}
