import BDContent
import XCTest

final class StringTests: XCTestCase {
  func testSlugify() throws {
    let actual = "'Indie Dev #4 - Making an App Best-in-Class with Jordan Morgan'".convertedToSlug()
    let expected = "indie-dev-4-making-an-app-best-in-class-with-jordan-morgan"

    XCTAssertEqual(actual, expected)
  }

  func testQuotes() {
    let actual = "'Indie Dev #4 - Making an App Best-in-Class with Jordan Morgan'".dequote()
    let expected = "Indie Dev #4 - Making an App Best-in-Class with Jordan Morgan"
    XCTAssertEqual(actual, expected)
  }

  func testUnicodeFix() {
    let text = "Learn four mistakes to avoid when designing your iOS App\u{2019}s UI so you can deliver a great experience to your users while keeping it easy to maintain."
    let actual = text.fixUnicodeEscape()
    let expected = "Learn four mistakes to avoid when designing your iOS App's UI so you can deliver a great experience to your users while keeping it easy to maintain."

    XCTAssertEqual(actual, expected)
  }
}
