import Contribute
import Foundation

/// Simple implementation of ``ProcessorSettings``
public struct Settings: ProcessorSettings {
  /// The URL for the content path
  public let contentPathURL: URL

  /// The URL for the resources path
  public let resourcesPathURL: URL

  /// The URL for the directory containing the export files.
  public let exportsDirectoryURL: URL

  /// The method to import assets from the WordPress site.
  public let assetImportSetting: AssetImportSetting

  /// Whether to overwrite existing assets.
  public let overwriteAssets: Bool

  /// Name of directory to store assets relative to ``resourcesPathURL``
  public let assetRelativePath: String

  /// Converts the given HTML string to Markdown string.
  public let markdownFromHTML: (String) throws -> String

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - contentPathURL: The URL for the content path
  ///   - resourcesPathURL: The URL for the resources path
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  ///   - markdownFromHTML: Converts the given HTML string to Markdown string.
  public init(
    contentPathURL: URL,
    resourcesPathURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownFromHTML: @escaping (String) throws -> String = { $0 }
  ) {
    self.contentPathURL = contentPathURL
    self.resourcesPathURL = resourcesPathURL
    self.exportsDirectoryURL = exportsDirectoryURL
    self.assetImportSetting = assetImportSetting
    self.overwriteAssets = overwriteAssets
    self.assetRelativePath = assetRelativePath
    self.markdownFromHTML = markdownFromHTML
  }

  /// Converts the given HTML string to Markdown string.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown string representation of the HTML.
  public func markdownFrom(html: String) throws -> String {
    try markdownFromHTML(html)
  }
}
