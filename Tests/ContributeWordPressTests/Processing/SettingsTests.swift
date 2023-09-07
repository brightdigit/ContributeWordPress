import Contribute
@testable import ContributeWordPress
import XCTest

internal final class SettingsTests: XCTestCase {
  internal let projectDirURL: URL = .temporaryDirURL

  internal var contentPathURL: URL {
    projectDirURL.appendingPathComponent(PublishDefaults.contentDirectoryName)
  }

  internal var resourcesPathURL: URL {
    projectDirURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName)
  }

  internal var exportsDirectoryURL: URL {
    .temporaryDirURL.appendingPathComponent("WordPress/exports")
  }

  internal var assetImportSetting: AssetImportSetting {
    .copyFilesFrom(projectDirURL.appendingPathComponent("WordPress/html"))
  }

  internal let overwriteAssets = true
  internal let assetRelativePath: String = "media/wordpress-assets"
  internal let markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared
  internal var markdownFromHTML: (String) throws -> String {
    markdownGenerator.markdown(fromHTML:)
  }

  internal let htmlSample: String = "<b>Html Sample</b>"

  internal func testDefaultInit() {
    let settings = Settings(
      contentPathURL: contentPathURL,
      resourcesPathURL: resourcesPathURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: markdownFromHTML
    )

    assertSettings(settings)
  }

  internal func assertSettings(_ settings: Settings) {
    XCTAssertEqual(settings.contentPathURL, contentPathURL)
    XCTAssertEqual(settings.resourcesPathURL, resourcesPathURL)
    XCTAssertEqual(settings.exportsDirectoryURL, exportsDirectoryURL)
    XCTAssertEqual(settings.assetImportSetting, assetImportSetting)
    XCTAssertEqual(settings.overwriteAssets, overwriteAssets)
    XCTAssertEqual(settings.assetRelativePath, assetRelativePath)

    XCTAssertNoThrow(try settings.markdownFromHTML(htmlSample))
    XCTAssertEqual(try settings.markdownFromHTML(htmlSample), htmlSample)
  }
}
