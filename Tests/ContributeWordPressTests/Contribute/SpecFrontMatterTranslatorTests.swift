import Contribute
@testable import ContributeWordPress
import SyndiKit
import XCTest

internal final class SpecFrontMatterTranslatorTests: XCTestCase {
  internal func testFrontMatterTranslation() throws {
    let sut: SpecFrontMatterTranslator = .init()

    let source = Source(
      sectionName: "...",
      post: try .areWeThereYetPost(tags: [.Podcasting, .Productivity]),
      featuredImage: "/media/wp-assets/leogdion/2019/01/image-e1547230562842-1024x682.jpg"
    )

    let specs = sut.frontMatter(from: source)

    XCTAssertEqual(specs.title, source.post.title)
    XCTAssertEqual(specs.date, source.post.postDateString)
    XCTAssertEqual(specs.description, source.post.description)
    XCTAssertEqual(specs.tags, source.post.tagsString)
    XCTAssertEqual(specs.featuredImage, source.featuredImage)
  }
}
