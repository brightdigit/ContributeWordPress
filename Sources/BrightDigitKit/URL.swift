import ArgumentParser
import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URL {
  func lastPathComponentWithoutExtension() -> String {
    deletingPathExtension().lastPathComponent
  }
}

extension URL: ExpressibleByArgument {
  public init?(argument: String) {
    self.init(string: argument)
  }
}
