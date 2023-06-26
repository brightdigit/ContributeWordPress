import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URL {
  func lastPathComponentWithoutExtension() -> String {
    deletingPathExtension().lastPathComponent
  }
}
