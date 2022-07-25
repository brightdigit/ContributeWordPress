import Foundation
import Publish
import ShellOut

public extension NPM {
  struct Job {
    public init(subcommand: Command, outputRelativePaths: [OutputPath] = [], arguments: [Argument] = []) {
      self.subcommand = subcommand
      self.outputRelativePaths = outputRelativePaths
      self.arguments = arguments
    }

    public init(subcommand: Command, outputRelativePaths: [OutputPath] = [], @NPM.ArgumentBuilder _ argBuilder: () -> [Argument]) {
      self.subcommand = subcommand
      self.outputRelativePaths = outputRelativePaths
      arguments = argBuilder()
    }

    public let subcommand: Command
    public let outputRelativePaths: [OutputPath]
    public let arguments: [Argument]
  }
}

public func ci() -> NPM.Job {
  .init(subcommand: .ci)
}

public func run(paths: [OutputPath] = [], @NPM.ArgumentBuilder _ arguments: () -> [NPM.Argument]) -> NPM.Job {
  .init(subcommand: .run, outputRelativePaths: paths, arguments)
}
