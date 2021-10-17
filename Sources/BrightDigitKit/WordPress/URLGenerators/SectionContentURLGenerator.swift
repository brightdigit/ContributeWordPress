import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct SectionContentURLGenerator: ContentURLGenerator {
  public func destinationURL(basedOnPost post: WordPressPost, fromFileName fileName: String, atContentPathURL contentPathURL: URL) -> URL {
    let sectionPath = contentPathURL.appendingPathComponent(fileName)
    return sectionPath.appendingPathComponent(post.name + ".md")
  }
}
