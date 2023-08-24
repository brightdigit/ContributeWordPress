import XCTest
import Contribute
@testable import ContributeWordPress

internal final class SettingsTests: XCTestCase {

  let projectDirURL: URL = .temporaryDirURL
  var contentPathURL: URL
  { projectDirURL.appendingPathComponent(PublishDefaults.contentDirectoryName) }
  var resourcesPathURL: URL
  { projectDirURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName) }
  var exportsDirectoryURL: URL
  { .temporaryDirURL.appendingPathComponent("WordPress/exports") }
  var assetImportSetting: AssetImportSetting
  { .copyFilesFrom(projectDirURL.appendingPathComponent("WordPress/html")) }
  let overwriteAssets: Bool = true
  let assetRelativePath: String = "media/wordpress-assets"
  let markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared
  var markdownFromHTML: (String) throws -> String { markdownGenerator.markdown(fromHTML:) }

  let htmlSample: String = "<b>Html Sample</b>"

  func testDefaultInit() {
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

  func assertSettings(_ settings: Settings) {
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
