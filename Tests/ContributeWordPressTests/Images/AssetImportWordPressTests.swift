@testable import ContributeWordPress
import XCTest

internal final class AssetImportWordPressTests: XCTestCase {
  internal func testExtractAssetImportFromPostWithAssets() throws {
    let site: WordPressSite = try .make(
      link: try .make(string: "https://leogdion.name"),
      posts: [.myYearInReviewPost()]
    )

    let rootPublishSiteURL: URL = .makeRootPublishSiteURL()
    let expoertingDirectoryURL: URL = rootPublishSiteURL
      .appendingPathComponent("WordPress/exports")

    let assetImports = AssetImport.extractAssetImports(
      from: site,
      using: Settings(
        rootPublishSiteURL: rootPublishSiteURL,
        exportsDirectoryURL: expoertingDirectoryURL
      )
    )

    XCTAssertFalse(assetImports.isEmpty)
  }

  internal func testExtractAssetImportFromPostWithoutAssets() throws {
    let site: WordPressSite = try .make(
      link: try .make(string: "https://leogdion.name"),
      posts: [.make(postID: 00, title: "fake", contentEncoded: "")]
    )

    let rootPublishSiteURL: URL = .makeRootPublishSiteURL()
    let expoertingDirectoryURL: URL = rootPublishSiteURL
      .appendingPathComponent("WordPress/exports")

    let assetImports = AssetImport.extractAssetImports(
      from: site,
      using: Settings(
        rootPublishSiteURL: rootPublishSiteURL,
        exportsDirectoryURL: expoertingDirectoryURL
      )
    )

    XCTAssertTrue(assetImports.isEmpty)
  }
}
