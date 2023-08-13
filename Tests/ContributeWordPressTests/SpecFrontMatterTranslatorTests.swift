import XCTest
import SyndiKit
import Contribute
@testable import ContributeWordPress

internal final class SpecFrontMatterTranslatorTests: XCTestCase {

    private var translator: SpecFrontMatterTranslator = .init()

    func testEmptySourceData() throws {
        let source = Source(
            sectionName: "...",
            post: try .make(title: "", description: nil, categories: []),
            featuredImage: nil
        )

        let specs = translator.frontMatter(from: source)

        assertSpecs(specs, vs: source)
    }

    func testFullSourceData() throws {
        let source = Source(
            sectionName: "...",
            post: try .areWeThereYetPost(tags: [.Podcasting, .Productivity]),
            featuredImage: "/media/wp-assets/leogdion/2019/01/image-e1547230562842-1024x682.jpg"
        )

        let specs = translator.frontMatter(from: source)


//        assertSpecs(specs, vs: source)
    }

    // MARK: - Helpers

    private func assertSpecs(_ specs: Specs, vs source: Source) {
        XCTAssertEqual(specs.title, source.post.title)
        XCTAssertEqual(specs.date, source.post.postDateString)
        XCTAssertEqual(specs.description, source.post.description)
        XCTAssertEqual(specs.tags, source.post.tagsString)
        XCTAssertEqual(specs.featuredImage, source.featuredImage)
    }
}
