import Foundation
import Publish
import ShellOut

public extension NPM {
  struct Command: ExpressibleByStringLiteral {
    public init(_ string: String) {
      self.string = string
    }

    public init(stringLiteral value: String) {
      string = value
    }

    let string: String

    public static let ci: Self = .init("ci")
    public static let run: Self = .init("run")
  }
}
