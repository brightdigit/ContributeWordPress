import Contribute
import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that generates a destination URL for a WordPress post.
public struct SectionContentURLGenerator: ContentURLGenerator {
  public typealias SourceType = Source

  /// Initializes a new `SectionContentURLGenerator` instance.
  public init() {}

  /// Generates a destination URL for the given WordPress post.
  ///
  /// - Parameters:
  ///   - source: The WordPress post to generate a URL for.
  ///   - contentPathURL: The content path URL.
  /// - Returns: The destination URL for the WordPress post.
  public func destinationURL(
    from source: Source,
    atContentPathURL contentPathURL: URL
  ) -> URL {
    let sectionPath = contentPathURL.appendingPathComponent(source.sectionName)
    return sectionPath.appendingPathComponent(source.post.name + ".md")
  }
}
