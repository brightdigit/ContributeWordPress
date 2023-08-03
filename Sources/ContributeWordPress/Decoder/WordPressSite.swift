import Foundation
import SyndiKit

public struct WordPressSite: BaseURLSite {
  public static let wpContentUploadsRelativePath = "wp-content/uploads"
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
    assetsImagesRegex: NSRegularExpression
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
    self.assetsImagesRegex = assetsImagesRegex
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

  public let posts: [WordPressPost]

  internal let assetsImagesRegex: NSRegularExpression
}

extension WordPressSite {
  public init(channel: RSSChannel) throws {
    try self.init(
      channel: channel,
      relativeResourcePath: WordPressSite.wpContentUploadsRelativePath
    )
  }

  public init(
    channel: RSSChannel,
    relativeResourcePath: String
  ) throws {
    let assetsImagesRegex = try Self.defaultAssetsImagesRegex(
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
      assetsImagesRegex: assetsImagesRegex
    )
  }

  static func defaultAssetsImagesRegex(
    forSite site: BaseURLSite,
    relativeResourcePath: String = WordPressSite.wpContentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try Self.defaultAssetsImagesRegex(
      forAssetSiteURL: site.baseURL,
      relativeResourcePath: relativeResourcePath
    )
  }

  static func defaultAssetsImagesRegex(
    forAssetSiteURL assetSiteURL: URL,
    relativeResourcePath: String = WordPressSite.wpContentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try NSRegularExpression(pattern: "\(assetSiteURL)/\(relativeResourcePath)([^\"]+)")
  }

  var importDirectoryName: String {
    baseURL.firstHostComponent ??
      baseSiteURL?.firstHostComponent ??
      "default"
  }
}
