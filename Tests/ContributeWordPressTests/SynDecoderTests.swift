import XCTest
import SyndiKit
@testable import ContributeWordPress

internal final class SynDecoderTests: XCTestCase {

  internal func testDecodingWordPressSite() throws {
    let sut = SynDecoder()

    guard let data = String.wpExport.data(using: .utf8) else {
      XCTFail("Expected data object from export string.")
      return
    }

    guard let decodedSite = try sut.decodeSites(fromData: data, allowInvalidCharacters: true) else {
      XCTFail("Expected a decoded WordPressSite.")
      return
    }

    let expectedSite = try WordPressSite.leogdion()

    XCTAssertEqual(decodedSite.title, expectedSite.title)
    XCTAssertEqual(decodedSite.link, expectedSite.link)
//    XCTAssertEqual(decodedSite.pubDate, expectedSite.pubDate)
//    XCTAssertEqual(decodedSite.categories, expectedSite.categories)
//    XCTAssertEqual(decodedSite.tags, expectedSite.tags)
    XCTAssertEqual(decodedSite.baseSiteURL, expectedSite.baseSiteURL)
    XCTAssertEqual(decodedSite.baseBlogURL, expectedSite.baseBlogURL)
//    XCTAssertEqual(decodedSite.posts, expectedSite.posts)
  }

}
