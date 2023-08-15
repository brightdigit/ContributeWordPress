import XCTest
import Contribute
@testable import ContributeWordPress

internal final class AssetDownloaderTests: XCTestCase {
  func testSuccessDownload() throws {
    let downloader = AssetDownloader(urlDownloader: MockSuccessFileDownloader())

    let assets: [AssetImport] = try myYearInReviewAssets()

    XCTAssertNoThrow(
      try downloader.download(assets: assets,allowsOverwrites: false)
    )
  }

  func testFailureDownload() throws {
    let downloader = AssetDownloader()

    let assets: [AssetImport] = try myYearInReviewAssets()

    XCTAssertThrowsError(
      try downloader.download(assets: assets, allowsOverwrites: false)
    ) { throwError in
      guard case WordPressError.assetDownloadErrors(let errors) = throwError else {
        XCTFail("Expected associated list of url->error.")
        return
      }

      let failedURLs: [URL] = Array(errors.keys)

      XCTAssertEqual(failedURLs.count, assets.count)

      for index in failedURLs.indices {
        let asset = assets[index]
        let url = failedURLs[index]

        XCTAssertEqual(url, asset.fromURL)
      }
    }
  }

  // MARK: - Helpers

  private func myYearInReviewAssets() throws -> [AssetImport] {
    [
      AssetImport(
        forPost: try .myYearInReviewPost(),
        sourceURL: .temporaryResourcesPathURL,
        assetRoot: "/media/wp-assets",
        resourcesPathURL:  URL(string: "https://leogdion.name/wp-content/uploads/2019/06/aleks-dorohovich-26-unsplash-701.jpeg")!,
        importPathURL: nil
      )
    ]
  }
}

private final class MockSuccessFileDownloader: URLDownloader {
  func download(
    from fromURL: URL,
    to toURL: URL,
    allowOverwrite: Bool,
    _ completion: @escaping (Error?) -> Void) {
      completion(nil)
  }
}
