// swiftlint:disable line_length
@testable import ContributeWordPress
import SyndiKit
import XCTest

internal final class DynamicRedirectGeneratorTests: XCTestCase {
  private var generator: DynamicRedirectGenerator = .init()
  private let blogSection: String = "blog"
  private let tutorialsSection: String = "tutorials"

  internal func testEmptySiteShouldGenerateNoRedirects() throws {
    let site: WordPressSite = try .make(posts: [])
    let redirects = generator.redirects(fromSites: [blogSection: site])

    XCTAssertTrue(redirects.isEmpty)
  }

  internal func testOneSiteWithSomeNumberOfPostsShouldGenerateSameNumberOfRedirects() throws {
    let posts: [WordPressPost] = [try .myYearInReviewPost(), try .podcastingPost()]
    let site: WordPressSite = try .make(posts: posts)

    testThenAssertRedirect(fromSites: [blogSection: site])
  }

  private func testThenAssertRedirect(fromSites allSites: [SectionName: WordPressSite]) {
    let tuples: [(WordPressPost, SectionName)] = allSites
      .map { section, site in site.posts.compactMap { ($0, section) } }
      .flatMap { $0 }
    let allPosts: [WordPressPost] = tuples.map(\.0)

    let redirects = generator.redirects(fromSites: allSites)

    XCTAssertEqual(redirects.count, allPosts.count)

    for index in redirects.indices {
      let redirect = redirects[index]
      let post = tuples[index].0

      XCTAssertEqual(
        redirect.redirectURLPath,
        generateUrlPath(fromName: tuples[index].1, wordpressPost: post)
      )
    }
  }

  internal func testMultipleSitesEachWithNumberOfPostsShouldGenerateSameNumberOfRedirectsPerSite() throws {
    let blogSite: WordPressSite = try .make(
      posts: [try .myYearInReviewPost(), try .podcastingPost()]
    )

    let tutorialsSite: WordPressSite = try .make(
      posts: [try .areWeThereYetPost(), try .fromGoalsToActionsPost()]
    )

    let allSites: [SectionName: WordPressSite] = [
      blogSection: blogSite,
      tutorialsSection: tutorialsSite
    ]

    testThenAssertRedirect(fromSites: allSites)
  }

  // MARK: - Helpers

  private func generateUrlPath(
    fromName name: String,
    wordpressPost post: WordPressPost
  ) -> String {
    DynamicRedirectGenerator.defaultURLPath(fromName: name, wordpressPost: post)
  }
}

extension WordPressPost: Hashable {
  public static func == (lhs: WordPressPost, rhs: WordPressPost) -> Bool {
    lhs.ID == rhs.ID
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(ID)
  }
}
