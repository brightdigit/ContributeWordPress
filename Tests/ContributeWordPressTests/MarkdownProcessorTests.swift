import XCTest
import Contribute
@testable import ContributeWordPress

// This seems an integration testing, than unit test.
//internal final class MarkdownProcessorTests: XCTestCase {
//    internal func test() throws {
//        let processor = MarkdownProcessor(
//            redirectFromatter: <#T##RedirectFormatter#>,
//            postFilters: <#T##[PostFilter]#>
//        )
//
//        try processor.begin(withSettings: <#T##ProcessorSettings#>)
//    }
//}
//
//final class MockProcessorSettings: ProcessorSettings {
//    var contentPathURL: URL
//
//    var resourcesPathURL: URL
//
//    var exportsDirectoryURL: URL
//
//    var importAssetPathURL: URL?
//
//    var overwriteAssets: Bool
//
//    var skipDownload: Bool
//
//    var assetRelativePath: String
//
//    func markdownFrom(html: String) throws -> String {
//        PandocMarkdownGenerator(shellOut: <#(String, [String]) throws -> String#>).markdown(fromHTML: html)
//    }
//}
