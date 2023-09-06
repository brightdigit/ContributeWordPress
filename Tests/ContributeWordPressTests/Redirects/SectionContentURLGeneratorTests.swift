@testable import ContributeWordPress
import XCTest

internal final class SectionContentURLGeneratorTests: XCTestCase {
  private let sut: SectionContentURLGenerator = .init()

  internal func testCorrectDestinationURL() throws {
    let source: Source = .make(
      sectionName: "blogs",
      post: try .myYearInReviewPost()
    )

    let contentPathURL: URL = .temporaryDirURL.appendingPathComponent("content")

    let expectedDestinationURL = generateDestinationURL(
      from: source,
      atContentPathURL: contentPathURL
    )

    let destinationURL = sut.destinationURL(
      from: source,
      atContentPathURL: contentPathURL
    )

    XCTAssertEqual(destinationURL, expectedDestinationURL)
  }

  // MARK: - Helpers

  private func generateDestinationURL(
    from source: Source,
    atContentPathURL contentPathURL: URL
  ) -> URL {
    contentPathURL
      .appendingPathComponent(source.sectionName)
      .appendingPathComponent(source.post.name + ".md")
  }
}
