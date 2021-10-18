import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol RedirectFormatter {
  func formatRedirects(_ redirects: [RedirectItem]) -> String
  func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL
}
