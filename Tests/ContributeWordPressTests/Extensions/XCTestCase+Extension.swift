import XCTest

extension XCTestCase {
  internal func assertThrowableBlock<T: EquatableError>(
    expectedError: T,
    _ throwableBlock: @autoclosure () throws -> Any
  ) {
    let expectation = XCTestExpectation()

    XCTAssertThrowsError(try throwableBlock()) { actualError in
      guard
        let actualError = actualError as? T,
        actualError == expectedError else {
        XCTFail("Expected error of type \(expectedError)")
        expectation.fulfill()
        return
      }

      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 0.100)
  }
}
