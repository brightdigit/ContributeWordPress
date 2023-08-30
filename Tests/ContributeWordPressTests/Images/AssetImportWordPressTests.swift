@testable import ContributeWordPress
import XCTest

internal final class AssetImportWordPressTests: XCTestCase {
  internal func testExtractAssetImports() throws {
    let site: WordPressSite = try .make(
      link: try .make(string: "https://leogdion.name"),
      posts: [
        .myYearInReviewPost()
      ]
    )

    let rootPublishSiteURL: URL = .temporaryDirURL
    let expoertingDirectoryURL: URL = rootPublishSiteURL
      .appendingPathComponent("WordPress/exports")

    let assetImports = AssetImport.extractAssetImports(
      from: site,
      using: Settings(
        rootPublishSiteURL: rootPublishSiteURL,
        exportsDirectoryURL: expoertingDirectoryURL
      )
    )

    // TODO: Only this final tests needs to be finished
    for assetImport in assetImports {
//      XCTAssertEqual(assetImport.parentID, site.???)

      print("fromURL: " + assetImport.fromURL.absoluteString)
      print("fromURL: " + assetImport.fromURL.absoluteString)
      print("parentID: \(assetImport.parentID)")
    }
  }
}
