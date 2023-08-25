import XCTest
@testable import ContributeWordPress

internal final class URLExtensionTests: XCTestCase {

  internal func testLastPathComponentWithoutExtension() throws {
    let expectedString = "banner.jpg"
    let filename = expectedString + ".jpg"

    let url: URL = try .make(
      string: "https://leogdion.name/wp-content/uploads/2018/12/"
    ).appendingPathComponent(filename)

    let actualString = url.lastPathComponentWithoutExtension()

    XCTAssertEqual(actualString, expectedString)
  }

  internal func testRelativePathFromBaseFileURL() throws {
    let projectPathURL: URL = .temporaryDirURL

    let expectedRelativePath = PublishDefaults.resourcesDirectoryName

    let resourcesURL: URL = projectPathURL
      .appendingPathComponent(expectedRelativePath)

    let baseURL: URL = projectPathURL

    let actualRelativePath = resourcesURL.relativePath(from: baseURL)

    XCTAssertEqual(actualRelativePath, expectedRelativePath)
  }

  internal func testRelativePathFromBaseNotFileURLShouldBeNil() throws {
    let projectPathURL: URL = try .make(string: "http://www.google.com")

    let expectedRelativePath = PublishDefaults.resourcesDirectoryName

    let resourcesURL: URL = projectPathURL
      .appendingPathComponent(expectedRelativePath)

    let baseURL: URL = projectPathURL

    let actualRelativePath = resourcesURL.relativePath(from: baseURL)

    XCTAssertNil(actualRelativePath)
  }

}
