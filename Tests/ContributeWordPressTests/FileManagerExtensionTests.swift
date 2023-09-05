import XCTest
@testable import ContributeWordPress

final class FileManagerExtensionTests: XCTestCase {
  func testSuccessfulCreateDirectory() throws {
    XCTAssertNoThrow(
      try FileManager.createDirectory(
        withName: "test",
        in: .temporaryDirURL
      )
    )
  }

  func testFailedCreateDirectory() throws {
    XCTAssertThrowsError(
      try FileManager.createDirectory(
        withName: "test",
        in: .init(string: "/fake/path")!
      )
    )
  }
}
