import Foundation
import SyndiKit

/// A protocol that defines the settings for the `WordPressMarkdownProcessor`.
public protocol ProcessorSettings {
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

  /// The URL of the directory that the posts assets should be imported.
  ///
  /// Example: /..../WordPress/html/
  var importAssetPathURL: URL? { get }

  /// Whether to overwrite existing assets.
  var overwriteAssets: Bool { get }

  /// Whether to skip downloading assets.
  var skipDownload: Bool { get }

  /// Name of directory to store assets relative to ``resourcesPathURL``
  var assetRelativePath: String { get }

  /// Converts the given HTML to Markdown.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown representation of the HTML.
  func markdownFrom(html: String) throws -> String

  /// Converts the given HTML to Markdown.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown representation of the HTML.
  func htmlFromPost(_ site: WordPressSite) -> ((WordPressPost) -> String)

  var uploadsRelativePath: String {
    get
  }
}

extension ProcessorSettings {
  public var resourceAssetPathURL: URL {
    resourcesPathURL.appendingPathComponent(assetRelativePath)
  }

  public func assetDirectoryPath(forSiteName siteName: String) -> String {
    let assetRelative = resourceAssetPathURL.relativePath(
      from: resourcesPathURL
    ) ?? resourcesPathURL.path

    return ["", assetRelative, siteName].joined(separator: "/")
  }

  public var uploadsRelativePath: String {
    WordPressSite.wpContentUploadsRelativePath
  }

  public func htmlFromPost(_ site: WordPressSite) -> ((WordPressPost) -> String) {
    let assetPostURLSearchPrefix = site
      .baseURL
      .appendingPathComponent(uploadsRelativePath)
      .absoluteString
    return { post in
      post.body.replacingOccurrences(
        of: assetPostURLSearchPrefix,
        with: self.assetDirectoryPath(forSiteName: site.importDirectoryName)
      )
    }
  }
}
