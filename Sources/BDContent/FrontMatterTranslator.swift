import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FrontMatterTranslator {
  associatedtype FrontMatterType: Encodable
  associatedtype SourceType
  init()
  func frontMatter(from source: SourceType) -> FrontMatterType
}
