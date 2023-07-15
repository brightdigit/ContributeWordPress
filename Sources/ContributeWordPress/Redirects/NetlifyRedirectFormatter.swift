import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct NetlifyRedirectFormatter: RedirectFormatter {
  public func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL {
    resourcesDirURL.appendingPathComponent("_redirects")
  }

  public func formatRedirects(_ redirects: [RedirectItem]) -> String {
    redirects.map { [$0.fromURLPath, $0.redirectURLPath].joined(separator: "\t") }.joined(separator: "\n")
  }
}
