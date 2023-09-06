@testable import ContributeWordPress
import XCTest

internal final class MarkdownProcessorExportDecoderTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulStep() throws {
    let exportDecoder = SitesExportDecoderSpy(.success(()))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: exportDecoder,
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: AssetDownloaderStub()
    )

    try sut.begin(withSettings: settings)

    XCTAssertTrue(exportDecoder.isCalled)
  }

  internal func testFailedStep() throws {
    let expectedError = SitesExportDecoderError.exportDecode
    let exportDecoder = SitesExportDecoderSpy(.failure(expectedError))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: exportDecoder,
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: AssetDownloaderStub()
    )

    assertThrowableBlock(
      expectedError: expectedError,
      try sut.begin(withSettings: settings)
    )
  }
}
