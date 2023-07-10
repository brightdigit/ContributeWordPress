import Contribute
import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct SpecFrontMatterTranslator: FrontMatterTranslator {
  public typealias FrontMatterType = Specs
  public typealias SourceType = WordPressSource

  public init() {}
  public func frontMatter(from source: WordPressSource) -> Specs {
    Specs(from: source)
  }
}
