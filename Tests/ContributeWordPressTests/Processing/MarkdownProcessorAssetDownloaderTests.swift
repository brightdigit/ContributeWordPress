import XCTest

@testable import ContributeWordPress

internal final class MarkdownProcessorAssetDownloaderTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulBeginAssetDownloaderStep() async throws {
    let assetDownloader = AssetDownloaderSpy(.success(()))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: assetDownloader,
      assetImportFactory: AssetImportFactoryStub().extractAssetImports(from:using:)
    )

    try await sut.begin(withSettings: settings)

    let isCalled = await assetDownloader.isCalled
    XCTAssertTrue(isCalled)
  }

  internal func testFailedBeginAssetDownloaderStep() async throws {
    let expectedError = AssetDownloaderError.unreachableDestination
    let assetDownloader = AssetDownloaderSpy(.failure(expectedError))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: assetDownloader,
      assetImportFactory: AssetImportFactoryStub().extractAssetImports(from:using:)
    )

    await assertThrowableBlock(
      expectedError: expectedError
    ) {
      try await sut.begin(withSettings: settings)
    }
  }
}
