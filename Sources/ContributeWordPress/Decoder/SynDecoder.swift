import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// An extension that enables SynDecoder to decode WordPress sites.
extension SynDecoder: WordPressDecoder {
  /// Decodes an array of WordPress sites from the given data.
  ///
  /// - Parameters:
  ///   - data: The data to decode.
  ///   - allowInvalidCharacters: Whether to allow invalid characters in the data.
  /// - Returns: The decoded WordPress site, or nil if decoding failed.
  /// - Throws: An error if data couldn't be decoded.
  public func decodeSites(
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
}
