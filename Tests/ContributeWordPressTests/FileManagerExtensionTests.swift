import XCTest

@testable import ContributeWordPress

internal final class FileManagerExtensionTests: XCTestCase {
  internal func testSuccessfulCreateDirectory() throws {
    XCTAssertNoThrow(
      try FileManager.createDirectory(
        withName: "test",
        in: .temporaryDirURL
      )
    )
  }

  internal func testFailedCreateDirectory() throws {
    XCTAssertThrowsError(
      try FileManager.createDirectory(
        withName: "test",
        in: URL(staticString: "/fake/path")
      )
    )
  }
}
