import XCTest

@testable import ContributeWordPress

internal final class MarkdownProcessorContentBuilderTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulBeginContentBuilerStep() async throws {
    let contentBuilder = MarkdownContentBuilderSpy(.success(()))

    let sut = MarkdownProcessor(
      contentBuilder: contentBuilder,
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: AssetDownloaderStub(),
      assetImportFactory: AssetImportFactoryStub().extractAssetImports(from:using:)
    )

    try await sut.begin(withSettings: settings)

    XCTAssertTrue(contentBuilder.isContentCalled)
  }

  internal func testFailedBeginContentBuilerStep() async throws {
    let expectedError = MarkdownContentBuilderError.content
    let contentBuilder = MarkdownContentBuilderSpy(.failure(expectedError))

    let sut = MarkdownProcessor(
      contentBuilder: contentBuilder,
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: AssetDownloaderStub(),
      assetImportFactory: AssetImportFactoryStub().extractAssetImports(from:using:)
    )

    await assertThrowableBlock(
      expectedError: expectedError
    ) {
      try await sut.begin(withSettings: settings)
    }
  }
}
