import XCTest
import SyndiKit
@testable import ContributeWordPress

final class SpecFrontMatterTranslatorTests: XCTestCase {

    private var translator: SpecFrontMatterTranslator!

    override func setUp() {
        translator = .init()
    }

    func test() throws {
        let featuredImage = "/media/wp-assets/leogdion/2019/01/image-e1547230562842-1024x682.jpg"
        let source = Source(
            sectionName: "blogs",
            post: try Self.makeWordPressPost(title: "diagram-for-goals"),
            featuredImage: featuredImage
        )

        let specs = translator.frontMatter(from: source)

        XCTAssertEqual(specs.title, source.post.title)
        // TODO: Not sure how to test this
//        XCTAssertEqual(specs.date, String(describing: source.post.pubDate))
        XCTAssertEqual(specs.description, nil)
        XCTAssertEqual(specs.featuredImage, featuredImage)
    }
}
