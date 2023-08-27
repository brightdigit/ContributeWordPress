@testable import ContributeWordPress
import XCTest

extension SettingsTests {
  internal func test_contentPathURL_shellOut() {
    let settings = Settings(
      contentPathURL: contentPathURL,
      resourcesPathURL: resourcesPathURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    ) { _, _ in
      self.htmlSample
    }

    assertSettings(settings)
  }

  internal func test_contentPathURL_markdownGenerator() {
    let settings = Settings(
      contentPathURL: contentPathURL,
      resourcesPathURL: resourcesPathURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownGenerator: markdownGenerator
    )

    assertSettings(settings)
  }

  internal func test_rootPublishSiteURL_defaultMarkdownFromHTML() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    )

    assertSettings(settings)
  }

  internal func test_rootPublishSiteURL_shellOut() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    ) { _, _ in
      self.htmlSample
    }

    assertSettings(settings)
  }

  internal func test_rootPublishSiteURL_markdownFromHTML() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: markdownFromHTML
    )

    assertSettings(settings)
  }

  internal func test_rootPublishSiteURL_markdownGenerator() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownGenerator: markdownGenerator
    )

    assertSettings(settings)
  }
}
