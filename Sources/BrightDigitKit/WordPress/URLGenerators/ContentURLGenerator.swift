import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol ContentURLGenerator {
  func destinationURL(basedOnPost post: WordPressPost, fromFileName fileName: String, atContentPathURL contentPathURL: URL) -> URL
}
