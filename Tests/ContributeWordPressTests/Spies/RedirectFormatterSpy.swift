import Foundation
import ContributeWordPress

final class RedirectFormatterSpy: RedirectFormatter {
  private(set) var formatRedirectsIsCalled: Bool = false
  private(set) var redirectsURLIsCalled: Bool = false

  func formatRedirects(_ redirects: [ContributeWordPress.RedirectItem]) -> String {
    formatRedirectsIsCalled = true

    return "redirects"
  }

  func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL {
    redirectsURLIsCalled = true

    return resourcesDirURL.appendingPathComponent("_redirects")
  }


}

