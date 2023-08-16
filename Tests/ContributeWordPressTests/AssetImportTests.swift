@testable import ContributeWordPress
import SyndiKit
import XCTest

internal final class AssetImportTests: XCTestCase {
  private let sampleResourcesPathURL: URL = .temporaryResourcesPathURL
  private let sampleAssetRoot: String = "/media/wp-assets"
  private let sampleSourceURL = URL(string: "https://leogdion.name/wp-content/uploads/2019/06/aleks-dorohovich-26-unsplash-701.jpeg")!

  internal func testRemoteAsset() throws {
    let post: WordPressPost = try .myYearInReviewPost()

    let asset = AssetImport(
      forPost: post,
      sourceURL: sampleSourceURL,
      assetRoot: sampleAssetRoot,
      resourcesPathURL: sampleResourcesPathURL,
      importPathURL: nil
    )

    let expectedAtURL = sampleResourcesPathURL.appendingPathComponent(asset.featuredPath)
    let expectedFeaturedPath = makeFeaturedPath(from: sampleSourceURL, assetRoot: sampleAssetRoot)

    XCTAssertEqual(asset.parentID, post.ID)
    XCTAssertEqual(asset.fromURL, sampleSourceURL)
    XCTAssertEqual(asset.atURL, expectedAtURL)
    XCTAssertEqual(asset.featuredPath, expectedFeaturedPath)
  }

  internal func testLocalAsset() throws {
    let post: WordPressPost = try .myYearInReviewPost()

    let importPathURL: URL = .temporaryDirURL
      .appendingPathComponent("WordPress")
      .appendingPathComponent(WordPressSite.contentUploadsRelativePath)

    let asset = AssetImport(
      forPost: post,
      sourceURL: sampleSourceURL,
      assetRoot: sampleAssetRoot,
      resourcesPathURL: sampleResourcesPathURL,
      importPathURL: importPathURL
    )

    let expectedFromURL = importPathURL.appendingPathComponent(sampleSourceURL.path)
    let expectedAtURL = sampleResourcesPathURL.appendingPathComponent(asset.featuredPath)
    let expectedFeaturedPath = makeFeaturedPath(from: sampleSourceURL, assetRoot: sampleAssetRoot)

    XCTAssertEqual(asset.parentID, post.ID)
    XCTAssertEqual(asset.fromURL, expectedFromURL)
    XCTAssertEqual(asset.atURL, expectedAtURL)
    XCTAssertEqual(asset.featuredPath, expectedFeaturedPath)
  }

  // MARK: - Helpers

  private func makeFeaturedPath(from sourceURL: URL, assetRoot: String) -> String {
    sourceURL.path
      .replacingOccurrences(
        of: ["", WordPressSite.contentUploadsRelativePath].joined(separator: "/"),
        with: assetRoot
      )
      .replacingOccurrences(of: "//", with: "/")
  }
}

// internal struct MockProcessorSettings: ProcessorSettings {
//  private let projectPath: URL = .temporaryResourcesPathURL
//
//  var contentPathURL: URL {
//    projectPath.appendingPathComponent(PublishDefaults.contentDirectoryName)
//  }
//
//  var resourcesPathURL: URL {
//    projectPath.appendingPathComponent(PublishDefaults.resourcesDirectoryName)
//  }
//
//  var exportsDirectoryURL: URL {
//    projectPath.appendingPathComponent("WordPress/exports")
//  }
//
//  var overwriteAssets: Bool { false }
//
//  var assetImportSetting: ContributeWordPress.AssetImportSetting = .none
//
//  var assetRelativePath: String { }
//
//  func markdownFrom(html: String) throws -> String {
//    fatalError("What to do here?")
//  }
// }
