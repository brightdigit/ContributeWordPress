@testable import ContributeWordPress
import XCTest

internal final class MarkdownProcessorRedirectWriterTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulStep() throws {
    let redirectWriter = RedirectFileWriterSpy(.success(()))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: redirectWriter,
      assetDownloader: AssetDownloaderStub()
    )

    try sut.begin(withSettings: settings)

    XCTAssertTrue(redirectWriter.isCalled)
  }

  internal func testFailedStep() throws {
    let expectedError = RedirectFileWriterError.writeRedirects

    let redirectWriter = RedirectFileWriterSpy(.failure(expectedError))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: redirectWriter,
      assetDownloader: AssetDownloaderStub()
    )

    assertThrowableBlock(
      expectedError: expectedError,
      try sut.begin(withSettings: settings)
    )
  }
}
