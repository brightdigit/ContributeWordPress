import Foundation

/// A protocol that defines the settings for the `WordPressMarkdownProcessor`.
public protocol WordPressMarkdownProcessorSettings {
  /// The URL for the content path
  ///
  /// Example: Content
  var contentPathURL: URL { get }

  /// The URL for the resources path
  ///
  /// Example: Resources
  var resourcesPathURL: URL { get }

  /// The URL for the directory
  ///
  /// Example: Import/WordPress
  var directoryURL: URL { get }

  /// The URL of the directory that the resource assets will be written to.
  ///
  /// Example: Resources/media/wp-assets
  var resourceAssetPathURL: URL { get }

  /// The URL of the directory that the posts assets should be imported.
  ///
  /// Example: WordPress/html/
  var importAssetPathURL: URL? { get }

  /// The URL from which assets will be downloaded
  ///
  /// Example: https://websitename.com
  var assetsSiteURL: URL { get }

  /// Whether to overwrite existing assets.
  var overwriteAssets: Bool { get }

  /// Whether to skip downloading assets.
  var skipDownload: Bool { get }

  /// Converts the given HTML to Markdown.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown representation of the HTML.
  static func markdownFrom(html: String) throws -> String
}
