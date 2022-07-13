import Foundation
import Plot
import Publish

protocol MissingField: CustomStringConvertible {
  static var typeName: String { get }
  var fieldName: String { get }
}

extension MissingField {
  var description: String {
    [Self.typeName, fieldName].joined(separator: ".")
  }
}
