import Foundation
import SyndiKit

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
      relativeResourcePath: WordPressSite.contentUploadsRelativePath
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
  internal static func defaultAssetURLRegex(
    forSite site: BaseURLSite,
    relativeResourcePath: String = WordPressSite.contentUploadsRelativePath
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
    relativeResourcePath: String = WordPressSite.contentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try NSRegularExpression(pattern: "\(assetSiteURL)/\(relativeResourcePath)([^\"]+)")
  }
}
