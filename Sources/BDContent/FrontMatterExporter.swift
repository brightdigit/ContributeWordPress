import Foundation
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FrontMatterExporter {
  associatedtype SourceType
  func frontMatterText(from source: SourceType) throws -> String
}

extension YAMLEncoder: FrontMatterFormatter {
  public func format<FrontMatterType>(_ frontMatter: FrontMatterType) throws -> String where FrontMatterType: Encodable {
    try encode(frontMatter).trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
