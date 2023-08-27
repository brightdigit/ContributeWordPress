import Contribute
@testable import ContributeWordPress
import XCTest

// TODO: Recheck this testing, we know better now in using Spy than Mock.
internal final class AssetDownloaderTests: XCTestCase {
  internal func testSuccessDownload() throws {
    let downloader = AssetDownloader(urlDownloader: MockSuccessFileDownloader())

    let assets: [AssetImport] = try myYearInReviewAssets()

    XCTAssertNoThrow(
      try downloader.download(assets: assets, allowsOverwrites: false)
    )
  }

  internal func testFailureDownload() throws {
    let downloader = AssetDownloader()

    let assets: [AssetImport] = try myYearInReviewAssets()

    XCTAssertThrowsError(
      try downloader.download(assets: assets, allowsOverwrites: false)
    ) { throwError in
      guard case let WordPressError.assetDownloadErrors(errors) = throwError else {
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
        resourcesPathURL: URL(string: "https://leogdion.name/wp-content/uploads/2019/06/aleks-dorohovich-26-unsplash-701.jpeg")!,
        importPathURL: nil
      )
    ]
  }
}

// TODO: @Leo, If approved, what is the appropriate place for this?
private final class MockSuccessFileDownloader: URLDownloader {
  func download(
    from _: URL,
    to _: URL,
    allowOverwrite _: Bool,
    _ completion: @escaping (Error?) -> Void
  ) {
    completion(nil)
  }
}
