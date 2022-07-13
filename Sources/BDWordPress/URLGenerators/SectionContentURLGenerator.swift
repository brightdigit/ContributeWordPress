import BDContent
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct SectionContentURLGenerator: ContentURLGenerator {
  public typealias SourceType = WordPressSource

  public init() {}
  public func destinationURL(basedOn source: WordPressSource, atContentPathURL contentPathURL: URL) -> URL {
    let sectionPath = contentPathURL.appendingPathComponent(source.sectionName)
    return sectionPath.appendingPathComponent(source.post.name + ".md")
  }
}
