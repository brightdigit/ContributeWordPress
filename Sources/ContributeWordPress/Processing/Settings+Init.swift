import Contribute
import Foundation

// swiftlint:disable file_length

extension Settings {
  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  ///   - markdownFromHTML: Converts the given HTML string to Markdown string.
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownFromHTML: @escaping (String) throws -> String
  ) {
    self.init(
      contentPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName),
      resourcesPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName),
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: markdownFromHTML
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - contentPathURL: The URL for the content path
  ///   - resourcesPathURL: The URL for the resources path
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  ///   - markdownGenerator: Converts the given HTML string to Markdown string.
  public init(
    contentPathURL: URL,
    resourcesPathURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownGenerator: MarkdownGenerator
  ) {
    self.init(
      contentPathURL: contentPathURL,
      resourcesPathURL: resourcesPathURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: markdownGenerator.markdown(fromHTML:)
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  ///   - markdownGenerator: Converts the given HTML string to Markdown string.
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared
  ) {
    self.init(
      contentPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName),
      resourcesPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName),
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownGenerator: markdownGenerator
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - contentPathURL: The URL for the content path
  ///   - resourcesPathURL: The URL for the resources path
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  ///   - temporaryFile: Creates a temporary file and returns the URL
  ///   - shellOut: Runs a `pandoc` command
  ///   for converting HTML to Markdown using `ShellOut`
  @available(*, deprecated, message: "Use temporaryFile of URL extension instead")
  public init(
    contentPathURL: URL,
    resourcesPathURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    temporaryFile: @escaping (String) throws -> URL =
      PandocMarkdownGenerator.Temporary.file(fromContent:),
    shellOut: @escaping (String, [String]) throws -> String
  ) {
    self.init(
      contentPathURL: contentPathURL,
      resourcesPathURL: resourcesPathURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownGenerator:
      PandocMarkdownGenerator(shellOut: shellOut, temporaryFile: temporaryFile)
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  ///   - temporaryFile: Creates a temporary file and returns the URL
  ///   - shellOut: Runs a `pandoc` command
  ///   for converting HTML to Markdown using `ShellOut`
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    temporaryFile: @escaping (String) throws -> URL =
      PandocMarkdownGenerator.Temporary.file(fromContent:),
    shellOut: @escaping (String, [String]) throws -> String
  ) {
    self.init(
      contentPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName),
      resourcesPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName),
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      temporaryFile: temporaryFile,
      shellOut: shellOut
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath:
  ///   Name of directory to store assets relative to ``resourcesPathURL``
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath
  ) {
    self.init(
      rootPublishSiteURL: rootPublishSiteURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: PassthroughMarkdownGenerator.shared.markdown(fromHTML:)
    )
  }
}
