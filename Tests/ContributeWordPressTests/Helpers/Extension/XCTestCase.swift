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
        actualError == expectedError
      else {
        XCTFail("Expected error of type \(expectedError)")
        expectation.fulfill()
        return
      }

      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 0.100)
  }

  /// Asserts that an asynchronous block throws `expectedError`.
  ///
  /// `XCTAssertThrowsError` cannot await, so this awaits the block directly and
  /// compares the caught error.
  internal func assertThrowableBlock<T: EquatableError>(
    expectedError: T,
    _ throwableBlock: () async throws -> Any
  ) async {
    do {
      _ = try await throwableBlock()
      XCTFail("Expected error of type \(expectedError)")
    } catch let actualError as T {
      XCTAssertEqual(actualError, expectedError)
    } catch {
      XCTFail("Expected error of type \(expectedError), got \(error)")
    }
  }
}
