import Foundation
import Publish
import ShellOut

public extension NPM {
  @resultBuilder
  enum ArgumentBuilder {
    public static func buildExpression(_ expression: Argument) -> [Argument] {
      [expression]
    }

    public static func buildExpression(_ expression: OutputPath) -> [Argument] {
      [.path(expression)]
    }

    public static func buildBlock(_ components: [Argument]...) -> [Argument] {
      components.flatMap { $0 }
    }
  }
}
