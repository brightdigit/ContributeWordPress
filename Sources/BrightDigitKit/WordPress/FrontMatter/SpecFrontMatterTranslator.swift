import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct SpecFrontMatterTranslator: FrontMatterTranslator {
  public typealias FrontMatterType = Specs

  public func frontMatter(fromWordpresPost post: WordPressPost) -> Specs {
    Specs(fromPost: post)
  }
}
