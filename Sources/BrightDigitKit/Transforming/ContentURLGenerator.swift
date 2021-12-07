import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol ContentURLGenerator {
  associatedtype SourceType
  func destinationURL(basedOn source: SourceType, atContentPathURL contentPathURL: URL) -> URL
}
