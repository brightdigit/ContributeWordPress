@testable import ContributeWordPress
import XCTest

internal final class MarkdownProcessorAssetImportTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testStep() throws {
    let assetImportFactory = AssetImportFactorySpy()

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: AssetDownloaderStub(),
      assetImportFactory: assetImportFactory.extractAssetImports(from:using:)
    )

    try sut.begin(withSettings: settings)

    XCTAssertTrue(assetImportFactory.isCalled)
  }
}
