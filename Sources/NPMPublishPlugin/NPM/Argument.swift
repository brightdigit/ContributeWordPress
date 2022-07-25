import Foundation
import Publish
import ShellOut

public extension NPM {
  enum Argument: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    case string(String)
    case path(OutputPath)

    public init(stringLiteral value: String) {
      self = .string(value)
    }
  }
}
