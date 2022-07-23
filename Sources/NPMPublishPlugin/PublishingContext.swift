import struct Files.Folder
import Foundation
import Publish
import ShellOut

extension PublishingContext: NPMContext {
  public func createOutput(for path: OutputPath) throws -> Output {
    switch path.type {
    case .file:
      return try self.createOutputFile(at: path.path)
    case .folder:
      return try self.createOutputFolder(at: path.path)
    }
  }
}
