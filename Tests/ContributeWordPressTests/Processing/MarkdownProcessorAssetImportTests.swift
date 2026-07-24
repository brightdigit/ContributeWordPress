import XCTest

@testable import ContributeWordPress

internal final class MarkdownProcessorAssetImportTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testStep() async throws {
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

    try await sut.begin(withSettings: settings)

    let isCalled = await assetImportFactory.isCalled
    XCTAssertTrue(isCalled)
  }
}
