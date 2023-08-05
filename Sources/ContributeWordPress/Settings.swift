import Contribute
import Foundation

public struct Settings: ProcessorSettings {
  public let contentPathURL: URL

  public let resourcesPathURL: URL

  public let exportsDirectoryURL: URL

  public let assetImportSetting: AssetImportSetting

  public let overwriteAssets: Bool

  public let assetRelativePath: String

  public let markdownFromHTML: (String) throws -> String

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

  public func markdownFrom(html: String) throws -> String {
    try markdownFromHTML(html)
  }
}
