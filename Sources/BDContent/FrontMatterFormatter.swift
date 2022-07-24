import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FrontMatterFormatter {
  func format<FrontMatterType>(_ frontMatter: FrontMatterType) throws -> String where FrontMatterType: Encodable
}
