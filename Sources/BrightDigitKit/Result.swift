import Foundation

public extension Result {
  @inlinable func tryMap<NewSuccess>(_ transform: (Success) throws -> NewSuccess) -> Result<NewSuccess, Failure> where Failure == Error {
    flatMap { success in
      Result<NewSuccess, Error> {
        try transform(success)
      }
    }
  }

  func unwrap<NewSuccess>(orError error: @autoclosure () -> Failure) -> Result<NewSuccess, Failure> where Success == NewSuccess? {
    flatMap { success in
      guard let value = success else {
        return .failure(error())
      }
      return .success(value)
    }
  }
}
