import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol PostsExportDecoder {
  func posts(fromExportsAt directoryURL: URL) throws -> [String: [WordPressPost]]
}
