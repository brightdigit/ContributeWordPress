import Contribute
@testable import ContributeWordPress
import XCTest

internal final class AssetDownloaderTests: XCTestCase {
  internal func testSuccessfulDownload() throws {
    let downloadSpy = FileDownloaderSpy(.success(()))

    let sut = AssetDownloader(urlDownloader: downloadSpy)

    let assets: [AssetImport] = try myYearInReviewAssets()

    XCTAssertNoThrow(
      try sut.download(assets: assets, allowsOverwrites: false)
    )

    XCTAssertTrue(downloadSpy.downloadIsCalled)
  }

  internal func testFailureDownload() throws {
    let downloadSpy = FileDownloaderSpy(.failure(.assetDownload))

    let sut = AssetDownloader(urlDownloader: downloadSpy)

    let assets: [AssetImport] = try myYearInReviewAssets()

    XCTAssertThrowsError(
      try sut.download(assets: assets, allowsOverwrites: false)
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
        resourcesPathURL: try .make(
          string: "https://leogdion.name/wp-content/uploads/2019/06/-unsplash-701.jpeg"
        ),
        importPathURL: nil
      )
    ]
  }
}
