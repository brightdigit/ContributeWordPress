import XCTest
import SyndiKit
@testable import ContributeWordPress

internal final class RegexKeyPostFilterTests: XCTestCase {

    func testNoFiltersShouldMatchEverything() throws {
        let filters: [RegexKeyPostFilter] = []

        let posts: [WordPressPost] = [
            try .make(title: "1st-post", type: "attachment"),
            try .make(title: "2d-post", type: "post"),
            try .make(title: "3rd-post", type: "post")
        ]

        let matched = posts.filter { post in
            filters.allSatisfy { $0.include(post) }
        }

        XCTAssertEqual(matched.count, posts.count)
    }

    func testSingleFilterShouldMatchSinglePost() throws {
        let filter = try RegexKeyPostFilter(pattern: "post", keyPath: \.type)

        let post: WordPressPost = try .make(title: "single-post")

        XCTAssertTrue(filter.include(post))
    }

    func testMultipleFiltersShouldOnlyMatchPublishedPosts() throws {
        let filters: [RegexKeyPostFilter] = [
            try RegexKeyPostFilter(pattern: "post", keyPath: \.type),
            try RegexKeyPostFilter(pattern: "publish", keyPath: \.status),
        ]

        let posts: [WordPressPost] = [
            try .make(title: "1st-post", type: "attachment"),
            try .make(title: "2d-post", type: "post"),
            try .make(title: "3rd-post", type: "post")
        ]

        let matched = posts.filter { post in
            filters.allSatisfy { $0.include(post) }
        }

        XCTAssertTrue(matched.count == 2)
    }
}
