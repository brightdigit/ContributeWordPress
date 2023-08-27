@testable import ContributeWordPress
import XCTest

// TODO: Update tests naming
extension SettingsTests {
  internal func test1() {
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

  internal func test2() {
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

  internal func test3() {
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

  internal func test4() {
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

  internal func test5() {
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

  internal func test6() {
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
