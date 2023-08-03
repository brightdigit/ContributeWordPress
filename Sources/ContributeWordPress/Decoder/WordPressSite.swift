import Foundation
import SyndiKit

/// A struct that represents a WordPress site.
public struct WordPressSite: BaseURLSite {
  public static let wpContentUploadsRelativePath = "wp-content/uploads"

  /// The name of the channel.
  public let title: String

  /// The URL to the HTML website corresponding to the channel.
  public let link: URL

  /// Phrase or sentence describing the channel.
  public let description: String?

  /// The publication date and time of the feed's content.
  public let pubDate: Date?

  /// The categories associated with the site.
  public let categories: [WordPressElements.Category]

  /// The tags associated with the site.
  public let tags: [WordPressElements.Tag]

  /// The URL for site hosting this blog.
  public let baseSiteURL: URL?

  /// The blog URL for this WordPress site.
  public let baseBlogURL: URL?

  /// The posts associated with the site.
  public let posts: [WordPressPost]

  internal let assetURLRegex: NSRegularExpression

  /// Initializes a `WordPressSite` instance.
  ///
  /// - Parameters:
  ///   - title: The name of the channel.
  ///   - link: The URL to the HTML website corresponding to the channel.
  ///   - description: Phrase or sentence describing the channel.
  ///   - pubDate: The publication date and time of the feed's content.
  ///   - categories: The categories associated with the site.
  ///   - tags: The tags associated with the site.
  ///   - baseSiteURL: The base site URL.
  ///   - baseBlogURL: The base blog URL.
  ///   - posts: The posts associated with the site.
  ///   - assetURLRegex: The regular expression for matching asset urls.
  // swiftlint:disable:next function_default_parameter_at_end
  public init(
    title: String,
    link: URL,
    description: String? = nil,
    pubDate: Date? = nil,
    categories: [WordPressElements.Category],
    tags: [WordPressElements.Tag],
    baseSiteURL: URL? = nil,
    baseBlogURL: URL? = nil,
    posts: [WordPressPost],
    assetURLRegex: NSRegularExpression
  ) {
    self.title = title
    self.link = link
    self.description = description
    self.pubDate = pubDate
    self.categories = categories
    self.tags = tags
    self.baseSiteURL = baseSiteURL
    self.baseBlogURL = baseBlogURL
    self.posts = posts
    self.assetURLRegex = assetURLRegex
  }
}

extension WordPressSite {
  /// Returns the import directory name.
  public var importDirectoryName: String {
    baseURL.firstHostComponent ??
      baseSiteURL?.firstHostComponent ??
      "default"
  }

  /// Initializes a `WordPressSite` instance from an ``RSSChannel``.
  ///
  /// - Parameters:
  ///   - channel: The `RSSChannel` instance.
  /// - Throws: An error if initialization fails.
  public init(channel: RSSChannel) throws {
    try self.init(
      channel: channel,
      relativeResourcePath: WordPressSite.wpContentUploadsRelativePath
    )
  }

  /// Initializes a `WordPressSite` instance from an ``RSSChannel`` with
  /// a relative resource path.
  ///
  /// - Parameters:
  ///   - channel: The RSSChannel instance.
  ///   - relativeResourcePath: The relative resource path.
  /// - Throws: An error if initialization fails.
  public init(
    channel: RSSChannel,
    relativeResourcePath: String
  ) throws {
    let assetURLRegex = try Self.defaultAssetURLRegex(
      forSite: channel,
      relativeResourcePath: relativeResourcePath
    )
    self.init(
      title: channel.title,
      link: channel.link,
      categories: channel.wpCategories,
      tags: channel.wpTags,
      baseSiteURL: channel.wpBaseSiteURL,
      baseBlogURL: channel.wpBaseBlogURL,
      posts: channel.items.compactMap(\.wpPost),
      assetURLRegex: assetURLRegex
    )
  }

  /// Returns the default regular expression for matching asset urls.
  ///
  /// - Parameters:
  ///   - site: The `BaseURLSite` instance.
  ///   - relativeResourcePath: The relative resource path where assets would be located.
  /// - Returns: The default regular expression for matching asset urls.
  /// - Throws: An error if the regular expression cannot be created.
  public static func defaultAssetURLRegex(
    forSite site: BaseURLSite,
    relativeResourcePath: String = WordPressSite.wpContentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try Self.defaultAssetURLRegex(
      forAssetSiteURL: site.baseURL,
      relativeResourcePath: relativeResourcePath
    )
  }

  /// Returns the default regular expression for matching asset url.
  ///
  /// - Parameters:
  ///   - assetSiteURL: The asset site URL.
  ///   - relativeResourcePath: The relative resource path.
  /// - Returns: The default regular expression for matching asset url.
  /// - Throws: An error if the regular expression cannot be created.
  public static func defaultAssetURLRegex(
    forAssetSiteURL assetSiteURL: URL,
    relativeResourcePath: String = WordPressSite.wpContentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try NSRegularExpression(pattern: "\(assetSiteURL)/\(relativeResourcePath)([^\"]+)")
  }
}