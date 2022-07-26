import struct Files.Folder
import Foundation
import Publish
import ShellOut

public extension NPM {
  struct Settings {
    init(npmPath: String? = nil, location: Location) {
      self.npmPath = npmPath ?? "npm"
      self.location = location
    }

    public init(npmPath: String? = nil, folder: Files.Folder) {
      self.init(npmPath: npmPath, location: .folder(folder))
    }

    public init(npmPath: String? = nil, path: Path) {
      self.init(npmPath: npmPath, location: .path(path))
    }

    enum Location {
      case folder(Files.Folder)
      case path(Path)
    }

    let npmPath: String
    let location: Location

    func folder(usingContext context: Context) throws -> Files.Folder {
      switch self.location {
      case let .folder(folder): return folder
      case let .path(path): return try context.folder(at: path)
      }
    }
  }
}
