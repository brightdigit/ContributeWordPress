import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FrontMatterTranslator {
  associatedtype FrontMatterType: Encodable
  func frontMatter(fromWordpresPost post: WordPressPost, withFeaturedImage featuredImage: String?) -> FrontMatterType
}
