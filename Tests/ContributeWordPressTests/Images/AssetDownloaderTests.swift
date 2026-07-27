import Contribute
import XCTest

import struct SyndiKit.WordPressPost

@testable import ContributeWordPress

internal final class AssetDownloaderTests: XCTestCase {
  internal func testSuccessfulDownload() async throws {
    let downloadSpy = FileDownloaderSpy(.success(()))

    let sut = AssetDownloader(urlDownloader: downloadSpy)

    let assets: [AssetImport] = try myYearInReviewAssets()

    try await sut.download(assets: assets, allowsOverwrites: false)

    let downloadIsCalled = await downloadSpy.downloadIsCalled
    XCTAssertTrue(downloadIsCalled)
  }

  internal func testFailureDownload() async throws {
    let downloadSpy = FileDownloaderSpy(.failure(.assetDownload))

    let sut = AssetDownloader(urlDownloader: downloadSpy)

    let assets: [AssetImport] = try myYearInReviewAssets()

    do {
      try await sut.download(assets: assets, allowsOverwrites: false)
      XCTFail("Expected the download to fail.")
    } catch let error as ContributeWordPress.WordPressError {
      guard case .assetDownloadErrors(let errors) = error else {
        XCTFail("Expected associated list of url->error.")
        return
      }

      let failedURLs: [URL] = Array(errors.keys)

      XCTAssertEqual(failedURLs.count, assets.count)

      // The task group finishes children in completion order, so compare as
      // sets rather than assuming the errors arrive in `assets` order.
      XCTAssertEqual(Set(failedURLs), Set(assets.map(\.fromURL)))
    }
  }

  /// Every failure is reported, even when many downloads fail concurrently.
  ///
  /// The previous `DispatchGroup` implementation wrote each failure into a
  /// shared dictionary from `URLSession`'s delegate queue, so entries could be
  /// lost or the dictionary corrupted. Collecting at the task-group join point
  /// removes the shared mutable state entirely.
  internal func testConcurrentFailuresAreAllCollected() async throws {
    let downloadSpy = FileDownloaderSpy(.failure(.assetDownload))

    let sut = AssetDownloader(urlDownloader: downloadSpy)

    let assets: [AssetImport] = try manyAssets(count: 200)

    do {
      try await sut.download(assets: assets, allowsOverwrites: false)
      XCTFail("Expected the download to fail.")
    } catch let error as ContributeWordPress.WordPressError {
      guard case .assetDownloadErrors(let errors) = error else {
        XCTFail("Expected associated list of url->error.")
        return
      }

      XCTAssertEqual(errors.count, assets.count)
      XCTAssertEqual(Set(errors.keys), Set(assets.map(\.fromURL)))
    }
  }

  // MARK: - Helpers

  private func myYearInReviewAssets() throws -> [AssetImport] {
    [
      AssetImport(
        forPost: try .myYearInReviewPost(),
        sourceURL: .temporaryResourcesPathURL,
        assetRoot: "/media/wp-assets",
        resourcesPathURL: URL(
          staticString: "https://leogdion.name/wp-content/uploads/2019/06/-unsplash-701.jpeg"
        ),
        importPathURL: nil
      )
    ]
  }

  private func manyAssets(count: Int) throws -> [AssetImport] {
    let post = try WordPressPost.myYearInReviewPost()

    // `fromURL` is derived from `sourceURL`, so that is what has to vary for the
    // assets to land under distinct keys in the collected error dictionary.
    return try (0..<count).map { index in
      guard
        let sourceURL = URL(
          string: "/wp-content/uploads/2019/06/asset-\(index).jpeg"
        )
      else {
        throw AssetDownloaderError.unreachableDestination
      }

      return AssetImport(
        forPost: post,
        sourceURL: sourceURL,
        assetRoot: "/media/wp-assets",
        resourcesPathURL: .temporaryResourcesPathURL,
        importPathURL: nil
      )
    }
  }
}
