import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FrontMatterTranslator {
  associatedtype FrontMatterType: Encodable
  associatedtype SourceType
  func frontMatter(from source: SourceType) -> FrontMatterType
}
