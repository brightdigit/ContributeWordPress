import Contribute
import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that converts front matter from a WordPress source to a `Specs` object.
public struct SpecFrontMatterTranslator: FrontMatterTranslator {
  public typealias SourceType = Source
  public typealias FrontMatterType = Specs

  /// Initialize a new instance of `SpecFrontMatterTranslator`.
  public init() {}

  /// Convert front matter from a WordPress source to a `Specs` object.
  ///
  /// - Parameter source: The WordPress source.
  /// - Returns: The converted from matter as `Specs` object .
  public func frontMatter(from source: Source) -> Specs {
    Specs(from: source)
  }
}
