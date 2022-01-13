import Foundation
import Publish

enum PiError: Error, LocalizedError {
  case missingContentFor(Location)
  case missingField(MissingField, Item<BrightDigitSite>)

  var errorDescription: String? {
    switch self {
    case let .missingContentFor(location):
      return "Missing content for location: \(location)"
    case let .missingField(field, item):
      return "Missing field \(field) from \(item.path)"
    }
  }
}
