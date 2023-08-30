import ContributeWordPress
import Foundation

internal struct RedirectFormatterStub: RedirectFormatter {
  internal func formatRedirects(_ redirects: [RedirectItem]) -> String {
    redirects
      .map { [$0.fromURLPath, $0.redirectURLPath].joined(separator: "\t") }
      .joined(separator: "\n")
  }

  internal func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL {
    resourcesDirURL.appendingPathComponent("_redirects")
  }
}
