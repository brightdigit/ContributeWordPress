import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FrontMatterExporter {
  func frontMatterText(fromWordPressPost post: WordPressPost, withFeaturedImage featuredImage: String?) throws -> String
}

extension YAMLEncoder: FrontMatterFormatter {
  public func format<FrontMatterType>(_ frontMatter: FrontMatterType) throws -> String where FrontMatterType: Encodable {
    try encode(frontMatter).trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
