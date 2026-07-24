import XCTest

@testable import ContributeWordPress

internal final class MarkdownProcessorRedirectWriterTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulStep() async throws {
    let redirectWriter = RedirectFileWriterSpy(.success(()))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: SitesExportDecoderStub(),
      postFilters: .default,
      redirectWriter: redirectWriter,
      assetDownloader: AssetDownloaderStub()
    )

    try await sut.begin(withSettings: settings)

    let isCalled = await redirectWriter.isCalled
    XCTAssertTrue(isCalled)
  }

  internal func testFailedStep() async throws {
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

    await assertThrowableBlock(
      expectedError: expectedError
    ) {
      try await sut.begin(withSettings: settings)
    }
  }
}
