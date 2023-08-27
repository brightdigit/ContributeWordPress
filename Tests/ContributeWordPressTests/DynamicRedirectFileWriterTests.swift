import XCTest
@testable import ContributeWordPress

internal final class DynamicRedirectFileWriterTests: XCTestCase {

  internal func testSuccessfulWriteRedirectsCall() throws {
    let formatter = RedirectFormatterSpy()

    let sut = DynamicRedirectFileWriter(
      postFilters: [],
      redirectFromatter: formatter
    )

    try sut.writeRedirects(
      fromSites: [:],
      inDirectory: .temporaryDirURL
    )

    XCTAssertTrue(formatter.formatRedirectsIsCalled)
    XCTAssertTrue(formatter.redirectsURLIsCalled)
  }

  internal func testSuccessfulWriteRedirectsCallB() throws {
    let formatter = RedirectFormatterSpy()

    let sut = DynamicRedirectFileWriter(
      redirectFromatter: formatter
    )

    try sut.writeRedirects(
      fromSites: [:],
      inDirectory: .temporaryDirURL
    )

    XCTAssertTrue(formatter.formatRedirectsIsCalled)
    XCTAssertTrue(formatter.redirectsURLIsCalled)
  }

  internal func testSuccessfulWriteRedirectsCallC() throws {
    let formatter = RedirectFormatterSpy()
    let filter = PostFilterSpy()
    let urlGenerate = UrlPathGenerateSpy()

    let sut = DynamicRedirectFileWriter(
      postFilter: filter.include(_:),
      urlPathGenerate: urlGenerate.generate(sectionName:post:),
      redirectFromatter: formatter
    )

    try sut.writeRedirects(
      fromSites: ["blogs": .leogdion()],
      inDirectory: .temporaryDirURL
    )

    XCTAssertTrue(formatter.formatRedirectsIsCalled)
    XCTAssertTrue(formatter.redirectsURLIsCalled)
    XCTAssertTrue(filter.isCalled)
    XCTAssertTrue(urlGenerate.isCalled)
  }

}
