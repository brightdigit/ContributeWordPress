import XCTest

extension XCTestCase {
  internal func assert<T, E: Error & Equatable>(
    _ expression: @autoclosure () throws -> T,
    throws error: E,
    in file: StaticString = #file,
    line: UInt = #line
  ) {
    var thrownError: Error?

    XCTAssertThrowsError(try expression(),
                         file: file, line: line) {
      thrownError = $0
    }

    XCTAssertTrue(
      thrownError is E,
      "Unexpected error type: \(type(of: thrownError))",
      file: file, line: line
    )

    XCTAssertEqual(
      thrownError as? E, error,
      file: file, line: line
    )
  }

  internal func assertThrowableBlock<T: EquatableError>(
    expectedError: T,
    _ throwableBlock: @autoclosure () throws -> Any
  ) {
    let expectation = XCTestExpectation()

    XCTAssertThrowsError(try throwableBlock()) { actualError in
      print(actualError)
      guard
        let actualError = actualError as? T,
        actualError == expectedError else {
        XCTFail("Expected error of type \(expectedError)")
        return
      }

      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 0.100)
  }
}
