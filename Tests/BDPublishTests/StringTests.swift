import BDPublish
import XCTest

final class StringTests: XCTestCase {
  func testFixEmojis() {
    let text = "This week the Epic trial (\\U0001F609 pun intended) against Apple has begun. What does that mean for us small folks getting into the App Store?"
    let actual = text.fixEmojiis()
    let expected = "This week the Epic trial (😉 pun intended) against Apple has begun. What does that mean for us small folks getting into the App Store?"

    XCTAssertEqual(actual, expected)
  }
}
