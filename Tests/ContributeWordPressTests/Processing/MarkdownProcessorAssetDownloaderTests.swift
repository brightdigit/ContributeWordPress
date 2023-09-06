@testable import ContributeWordPress
import XCTest

internal final class MarkdownProcessorAssetDownloaderTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulBeginAssetDownloaderStep() throws {
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

    try sut.begin(withSettings: settings)

    XCTAssertTrue(assetDownloader.isCalled)
  }

  internal func testFailedBeginAssetDownloaderStep() throws {
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

    assertThrowableBlock(
      expectedError: expectedError,
      try sut.begin(withSettings: settings)
    )
  }
}
