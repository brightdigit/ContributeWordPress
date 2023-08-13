@testable import ContributeWordPress
import XCTest

internal final class NetlifyRedirectFormatterTests: XCTestCase {
  private var formatter: NetlifyRedirectFormatter = .init()

  internal func testEmptyRedirectItemsShouldReturnEmptyString() {
    let redirects = formatter.formatRedirects([])

    XCTAssertTrue(redirects.isEmpty)
  }

  internal func testNumberOfRedirectItemsShouldReturn() {
    let redirectItems: [RedirectItem] = [
      .init(
        fromURLPath: "/blog/2014/04/01/hello-emscripten",
        redirectURLPath: "/articles/hello-emscripten"
      ),
      .init(
        fromURLPath: "/blog/2018/10/11/new-apple-watch-4",
        redirectURLPath: "/articles/new-apple-watch-4"
      )
    ]

    let redirects = formatter.formatRedirects(redirectItems)
    let lines = redirects.split(separator: "\n")

    XCTAssertEqual(lines.count, redirectItems.count)
  }

  internal func testNumberOfRedirectItemsShouldReturnCorrectLinePerRedirect() {
    let redirectItems: [RedirectItem] = [
      .init(
        fromURLPath: "/blog/2014/04/01/hello-emscripten",
        redirectURLPath: "/articles/hello-emscripten"
      )
    ]

    let redirects = formatter.formatRedirects(redirectItems)

    let firstLine = redirects.split(separator: "\n").first
    let lineParts = firstLine?.split(separator: "\t") ?? []

    XCTAssertTrue(lineParts.count == 2)
  }
}
