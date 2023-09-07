import ContributeWordPress
import Foundation

internal final class RedirectFormatterSpy: RedirectFormatter {
  internal private(set) var formatRedirectsIsCalled = false
  internal private(set) var redirectsURLIsCalled = false

  internal func formatRedirects(_: [ContributeWordPress.RedirectItem]) -> String {
    formatRedirectsIsCalled = true

    return "redirects"
  }

  internal func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL {
    redirectsURLIsCalled = true

    return resourcesDirURL.appendingPathComponent("_redirects")
  }
}
