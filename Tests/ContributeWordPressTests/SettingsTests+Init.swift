import XCTest
@testable import ContributeWordPress

extension SettingsTests {
  func test1() {
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

  func test2() {
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

  func test3() {
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

  func test4() {
    let settings = Settings(
      contentPathURL: contentPathURL,
      resourcesPathURL: resourcesPathURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      shellOut: { _, _ in self.htmlSample }
    )

    assertSettings(settings)
  }

  func test5() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      shellOut: { _, _ in self.htmlSample }
    )

    assertSettings(settings)
  }

  func test6() {
    let settings = Settings(
      rootPublishSiteURL: projectDirURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath
    )

    assertSettings(settings)
  }

}
