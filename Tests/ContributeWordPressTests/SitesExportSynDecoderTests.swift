import XCTest
@testable import ContributeWordPress

internal final class SitesExportSynDecoderTests: XCTestCase {

  // MARK: - fileURLsFromDirectory Tests

  internal func testSuccessfulFileURLsFromDirectory() throws {
    let spy = FileURLFromDirectorySpy(.success(()))

    let sut = SitesExportSynDecoder(
      fileURLsFromDirectory: spy.fileURLsFromDirectory(_:)
    )

    _ = try sut.sites(fromExportsAt: .temporaryDirURL)

    XCTAssertTrue(spy.fromDirectoryIsCalled)
  }

  internal func testFailedFileURLsFromDirectory() throws {
    let spy = FileURLFromDirectorySpy(.failure(.fileURLsFromDirectory))

    let sut = SitesExportSynDecoder(
      fileURLsFromDirectory: spy.fileURLsFromDirectory(_:)
    )

    assertThrowableBlock(
      expectedError: SitesExportSynDecoderError.fileURLsFromDirectory,
      try sut.sites(fromExportsAt: .temporaryDirURL)
    )
  }

  // MARK: - keyFromURL Tests

  // TODO: Any idea about this, or no need?
//  internal func testKeyFromURLCall() throws {
//    let spy = KeyFromURLSpy()
//
//    let sut = SitesExportSynDecoder(
//      fileURLsFromDirectory: { _ in [URL]() },
//      keyFromURL: spy.keyFromURL(_:)
//    )
//
//    _ = try sut.sites(fromExportsAt: .temporaryDirURL)
//
//    XCTAssertTrue(spy.keyFromURLIsCalled)
//  }

}
