import XCTest

@testable import ContributeWordPress

extension SettingsTests {
  internal func testContentPathURLMarkdownGenerator() {
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

  internal func testRootPublishSiteURLDefaultMarkdownFromHTML() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    )

    assertSettings(settings)
  }

  internal func testRootPublishSiteURLMarkdownFromHTML() {
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

  internal func testRootPublishSiteURLMarkdownGenerator() {
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
