import Foundation

public extension FileManager {
  var currentDirectoryURL: URL {
    URL(fileURLWithPath: FileManager.default.currentDirectoryPath, isDirectory: true)
  }
}
