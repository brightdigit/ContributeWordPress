import Foundation
import Publish

public enum PiError: Error, LocalizedError {
  case missingContentFor(Location)
  case missingField(MissingField, AnyItem)

  public var errorDescription: String? {
    switch self {
    case let .missingContentFor(location):
      return "Missing content for location: \(location)"
    case let .missingField(field, item):
      return "Missing field \(field) from \(item.path)"
    }
  }
}
