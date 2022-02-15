import Foundation
import Prch

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

  init<DefaultResponseType>(
    response: ClientResult<Success, DefaultResponseType>
  ) where Failure == Error {
    let value: Success
    do {
      value = try response.get()
      self = .success(value)
    } catch {
      self = .failure(error)
    }
  }
}
