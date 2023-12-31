@testable import ContributeWordPress
import SyndiKit
import XCTest

internal final class SynDecoderTests: XCTestCase {
  internal func testDecodingWordPressSite() throws {
    let sut = SynDecoder()

    guard let data = String.wpExport.data(using: .utf8) else {
      XCTFail("Expected data object from export string.")
      return
    }

    let decodedSite = try sut.decodeSites(fromData: data, allowInvalidCharacters: true)

    guard let decodedSite = decodedSite else {
      XCTFail("Expected a decoded WordPressSite.")
      return
    }

    let expectedSite = try WordPressSite.leogdion()

    assert(decodedSite: decodedSite, against: expectedSite)
  }

  private func assert(decodedSite: WordPressSite, against expectedSite: WordPressSite) {
    XCTAssertEqual(decodedSite.title, expectedSite.title)
    XCTAssertEqual(decodedSite.link, expectedSite.link)
    XCTAssertEqual(decodedSite.baseSiteURL, expectedSite.baseSiteURL)
    XCTAssertEqual(decodedSite.baseBlogURL, expectedSite.baseBlogURL)
    XCTAssertEqual(decodedSite.categories, expectedSite.categories)
    XCTAssertEqual(decodedSite.tags, expectedSite.tags)
    XCTAssertEqual(decodedSite.pubDate, expectedSite.pubDate)
  }
}
