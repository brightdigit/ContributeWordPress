import XCTest
@testable import ContributeWordPress

final class DynamicRedirectGeneratorTests: XCTestCase {

    private var generator: DynamicRedirectGenerator!

    override func setUp() {
        generator = DynamicRedirectGenerator()
    }

    func test() throws {
        let site = try Self.makeWordPressSite(
            posts: [try Self.myYearInReviewPost(), try Self.podcastingPost()]
        )
        let items = generator.redirects(fromSites: ["blogs" : site])

        print(items[0])
        print(items[1])
    }

}
//URL(string: "https://leogdion.name")!
