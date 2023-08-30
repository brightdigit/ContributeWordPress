// swiftlint:disable force_unwrapping
@testable import ContributeWordPress
import SyndiKit
import XCTest

internal final class AssetImportTests: XCTestCase {
  private let sampleResourcesPathURL: URL = .temporaryResourcesPathURL
  private let sampleAssetRoot: String = "/media/wp-assets"
  private let sampleSourceURL = URL(
    string: "https://leogdion.name/wp-content/uploads/2019/06/unsplash-701.jpeg"
  )!
  private var sampleFeaturedPath: String {
    sampleSourceURL.path
      .replacingOccurrences(
        of: ["", WordPressSite.contentUploadsRelativePath].joined(separator: "/"),
        with: sampleAssetRoot
      )
      .replacingOccurrences(of: "//", with: "/")
  }

  internal func testRemoteAsset() throws {
    let post: WordPressPost = try .myYearInReviewPost()

    let sut = makeSampleAssetImport(forPost: post, importPathURL: nil)

    let expectedFromURL = sampleSourceURL
    let expectedAtURL = sampleResourcesPathURL
      .appendingPathComponent(sut.featuredPath)

    assetSampleAsset(
      sut,
      expectedPostID: post.ID,
      expectedFromURL: expectedFromURL,
      expectedAtURL: expectedAtURL
    )
  }

  internal func testLocalAsset() throws {
    let post: WordPressPost = try .myYearInReviewPost()

    let importPathURL: URL = .temporaryDirURL
      .appendingPathComponent("WordPress")
      .appendingPathComponent(WordPressSite.contentUploadsRelativePath)

    let sut = makeSampleAssetImport(forPost: post, importPathURL: importPathURL)

    let expectedFromURL = importPathURL
      .appendingPathComponent(sampleSourceURL.path)
    let expectedAtURL = sampleResourcesPathURL
      .appendingPathComponent(sut.featuredPath)

    assetSampleAsset(
      sut,
      expectedPostID: post.ID,
      expectedFromURL: expectedFromURL,
      expectedAtURL: expectedAtURL
    )
  }

  private func assetSampleAsset(
    _ asset: AssetImport,
    expectedPostID postID: Int,
    expectedFromURL: URL,
    expectedAtURL: URL
  ) {
    let expectedFeaturedPath: String = sampleFeaturedPath

    XCTAssertEqual(asset.parentID, postID)
    XCTAssertEqual(asset.fromURL, expectedFromURL)
    XCTAssertEqual(asset.atURL, expectedAtURL)
    XCTAssertEqual(asset.featuredPath, expectedFeaturedPath)
  }

  // MARK: - Helpers

  private func makeSampleAssetImport(
    forPost post: WordPressPost,
    importPathURL: URL?
  ) -> AssetImport {
    .init(
      forPost: post,
      sourceURL: sampleSourceURL,
      assetRoot: sampleAssetRoot,
      resourcesPathURL: sampleResourcesPathURL,
      importPathURL: importPathURL
    )
  }
}
