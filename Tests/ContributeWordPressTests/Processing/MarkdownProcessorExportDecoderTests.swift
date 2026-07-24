import XCTest

@testable import ContributeWordPress

internal final class MarkdownProcessorExportDecoderTests: XCTestCase {
  private let settings = SettingsStub()

  internal func testSuccessfulStep() async throws {
    let exportDecoder = SitesExportDecoderSpy(.success(()))

    let sut = MarkdownProcessor(
      contentBuilder: MarkdownContentBuilderStub(),
      destinationURLGenerator: ContentURLGeneratorStub(),
      exportDecoder: exportDecoder,
      postFilters: .default,
      redirectWriter: RedirectFileWriterStub(),
      assetDownloader: AssetDownloaderStub()
    )

    try await sut.begin(withSettings: settings)

    let isCalled = await exportDecoder.isCalled
    XCTAssertTrue(isCalled)
  }

  internal func testFailedStep() async throws {
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

    await assertThrowableBlock(
      expectedError: expectedError
    ) {
      try await sut.begin(withSettings: settings)
    }
  }
}
