import Foundation
import SyndiKit

/// A protocol that defines the settings for the `WordPressMarkdownProcessor`.
public protocol WordPressMarkdownProcessorSettings {
  /// The URL for the content path
  ///
  /// Example: /..../Content/
  var contentPathURL: URL { get }

  /// The URL for the resources path
  ///
  /// Example: /..../Resources/
  var resourcesPathURL: URL { get }

  /// The URL for the directory
  ///
  /// Example: /..../WordPress/exports/
  var exportsDirectoryURL: URL { get }

  /// The URL of the directory that the resource assets will be written to.
  ///
  /// Example: /..../Resources/media/wp-assets/
  var resourceAssetPathURL: URL { get }

  /// The URL of the directory that the posts assets should be imported.
  ///
  /// Example: /..../WordPress/html/
  var importAssetPathURL: URL? { get }

  /// The URL from which assets will be downloaded
  ///
  /// Example: https://websitename.com
  var assetSiteURL: URL { get }

  /// Whether to overwrite existing assets.
  var overwriteAssets: Bool { get }

  /// Whether to skip downloading assets.
  var skipDownload: Bool { get }

  /// Name of directory to store assets relative to `ResourceAssetPathURL`
  var assetDirectoryName: String { get }

  @available(*, deprecated, message: "Use imports rather then prefix.")
  var assetPostURLSearchPrefix: String { get }

  var assetsImagesRegex: NSRegularExpression { get }

  /// Converts the given HTML to Markdown.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown representation of the HTML.
  static func markdownFrom(html: String) throws -> String

  /// Converts the given HTML to Markdown.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown representation of the HTML.
  func htmlFromPost(_ post: WordPressPost) -> String
}

extension WordPressMarkdownProcessorSettings {
  public var assetDirectoryName: String {
    assetSiteURL.host?
      .components(separatedBy: ".")
      .first ?? "default"
  }

  public var assetDirectoryPath: String {
    let assetRelative = resourceAssetPathURL.relativePath(
      from: resourcesPathURL
    ) ?? resourcesPathURL.path

    return ["", assetRelative, assetDirectoryName].joined(separator: "/")
  }

  public func defaultAssetsImagesRegex() throws -> NSRegularExpression {
    try NSRegularExpression(pattern: "\(assetSiteURL)/wp-content/uploads([^\"]+)")
  }

  public var assetPostURLSearchPrefix: String {
    "\(assetSiteURL)/wp-content/uploads"
  }

  public func htmlFromPost(_ post: WordPressPost) -> String {
    post.body.replacingOccurrences(
      of: assetPostURLSearchPrefix,
      with: assetDirectoryPath
    )
  }
}
