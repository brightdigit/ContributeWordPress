import struct Files.Folder
import Foundation
import Publish

public protocol NPMContext {
  func createOutput(for path: OutputPath) throws -> Output
  func folder(at path: Path) throws -> Folder
}

public extension NPM {
  typealias Context = NPMContext
}
