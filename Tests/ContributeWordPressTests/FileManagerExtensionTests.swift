// swiftlint:disable force_unwrapping
@testable import ContributeWordPress
import XCTest

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
        in: .init(string: "/fake/path")!
      )
    )
  }
}
