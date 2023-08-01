import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct WordPressSite {
  public init(title: String, link: URL, description: String? = nil, pubDate: Date? = nil, categories: [WordPressElements.Category], tags: [WordPressElements.Tag], baseSiteURL: URL? = nil, baseBlogURL: URL? = nil, posts: [WordPressPost]) {
    self.title = title
    self.link = link
    self.description = description
    self.pubDate = pubDate
    self.categories = categories
    self.tags = tags
    self.baseSiteURL = baseSiteURL
    self.baseBlogURL = baseBlogURL
    self.posts = posts
  }
  
  /// The name of the channel.
  public let title: String

  /// The URL to the HTML website corresponding to the channel.
  public let link: URL

  /// Phrase or sentence describing the channel.
  public let description: String?


  /// indicates the publication date and time of the feed's content
  public let pubDate: Date?

  public let categories: [WordPressElements.Category]
  public let tags: [WordPressElements.Tag]
  public let baseSiteURL: URL?
  public let baseBlogURL: URL?
  
  public let posts : [WordPressPost]
}

extension WordPressSite {
  public init (channel: RSSChannel) {
    self.init(title: channel.title, link: channel.link
              , categories: channel.wpCategories, tags: channel.wpTags, posts: channel.items.compactMap(\.wpPost))
  }
}

/// An extension that enables SynDecoder to decode WordPress posts.
extension SynDecoder: WordPressDecoder {
  
  public func decodePosts(fromData data: Data, allowInvalidCharacters: Bool) throws -> WordPressSite? {
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
    return rss.flatMap{$0.channel}.map(WordPressSite.init)
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
