import Contribute
import Foundation

extension Settings {
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
    markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared
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
}
