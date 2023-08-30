@testable import ContributeWordPress
import SyndiKit
import XCTest

internal final class RegexKeyPostFilterTests: XCTestCase {
  internal func testNoFiltersShouldMatchEverything() throws {
    let sut: [RegexKeyPostFilter] = []

    let posts: [WordPressPost] = [
      try .attachmentA(),
      try .attachmentB(),
      try .attachmentC()
    ]

    let matched = posts.filter { post in
      sut.allSatisfy { $0.include(post) }
    }

    XCTAssertEqual(matched.count, posts.count)
  }

  internal func testSinglePostFilterShouldMatchSinglePost() throws {
    let sut = try RegexKeyPostFilter(pattern: "post", keyPath: \.type)

    let post: WordPressPost = try .areWeThereYetPost()

    XCTAssertTrue(sut.include(post))
  }

  internal func testMultipleFiltersShouldOnlyMatchPublishedPosts() throws {
    let sut: [RegexKeyPostFilter] = [
      try RegexKeyPostFilter(pattern: "post", keyPath: \.type),
      try RegexKeyPostFilter(pattern: "publish", keyPath: \.status)
    ]

    let posts: [WordPressPost] = [
      try .attachmentA(),
      try .areWeThereYetPost(),
      try .productivityAppsPost()
    ]

    let matched = posts.filter { post in
      sut.allSatisfy { $0.include(post) }
    }

    XCTAssertTrue(matched.count == 2)
  }
}
