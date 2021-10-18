import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol WordPressDecoder {
  func decodePosts(fromData data: Data, allowInvalidCharacters: Bool) throws -> [WordPressPost]?
}
