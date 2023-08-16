import XCTest
@testable import ContributeWordPress

final class AssetImportTests_WordPress: XCTestCase {

  internal func testExtractAssetImports() throws {
    let site: WordPressSite = try .make(
      posts: [
        .productivityAppsPost()
      ]
    )

//    print(site.posts.first?.body)

    let rootPublishSiteURL: URL = .temporaryDirURL
    let x = AssetImport.extractAssetImports(
      from: site,
      using: Settings(
        rootPublishSiteURL: rootPublishSiteURL,
        exportsDirectoryURL: rootPublishSiteURL.appendingPathComponent("WordPress/exports")
      )
    )

    print(site.assetURLRegex.pattern)

    print(x)
  }

}
