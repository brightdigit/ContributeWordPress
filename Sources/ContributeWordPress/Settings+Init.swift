import Contribute
import Foundation

extension Settings {
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownFromHTML: @escaping (String) throws -> String = { $0 }
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

  public init(
    contentPathURL: URL,
    resourcesPathURL: URL,
    exportsDirectoryURL: URL,
    markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath
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

  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath
  ) {
    self.init(
      contentPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName),
      resourcesPathURL:
      rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName),
      exportsDirectoryURL: exportsDirectoryURL,
      markdownGenerator: markdownGenerator,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    )
  }

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
      markdownGenerator:
      PandocMarkdownGenerator(shellOut: shellOut, temporaryFile: temporaryFile),
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    )
  }

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
}
