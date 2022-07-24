import struct Files.Folder
import Foundation
import Publish
import ShellOut

public extension ShellOutCommand {
  /// Initialize a git repository
  static func npm(_ job: NPM.Job, withSettings settings: NPM.Settings, andContext context: NPM.Context) throws -> ShellOutCommand {
    let folder = try settings.folder(usingContext: context)

    let outputPathMap = try job.outputRelativePaths.reduce(into: [OutputPath: String]()) { partialResult, path in
      let output = try context.createOutput(for: path)

      partialResult[path] = output.url.relativePath(from: folder.url)
    }
    let argumentsArray: [String] = job.arguments.map { arg in
      switch arg {
      case let .string(value): return value
      case let .path(path): return "\"\(outputPathMap[path]!)\""
      }
    }
    let arguments = argumentsArray.joined(separator: " ")
    return ShellOutCommand(string: "\(settings.npmPath) \(job.subcommand.string) \(arguments)")
  }
}
