@testable import ContributeWordPress
import XCTest

internal final class MarkdownProcessorContentBuilderTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulBeginContentBuilerStep() throws {
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

    try sut.begin(withSettings: settings)

    XCTAssertTrue(contentBuilder.isContentCalled)
  }

  internal func testFailedBeginContentBuilerStep() throws {
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

    assertThrowableBlock(
      expectedError: expectedError,
      try sut.begin(withSettings: settings)
    )
  }
}
