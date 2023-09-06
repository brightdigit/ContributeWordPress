// swiftlint:disable file_length
// swiftlint:disable type_body_length
@testable import ContributeWordPress
import XCTest

internal final class MarkdownProcessorTests: XCTestCase {
  private let settings = SettingsStub()

  // MARK: - exportDecoder Tests

  internal func testSuccessfulBeginExportDecoderStep() throws {
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

  internal func testFailedBeginExportDecoderStep() throws {
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

  // MARK: - redirectWriter Tests

  internal func testSuccessfulBeginRedirectWriterStep() throws {
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

  internal func testFailedBeginRedirectWriterStep() throws {
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

  // MARK: - assetImportFactory Tests

  internal func testBeginAssetImportExtract() throws {
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

  // MARK: - assetDownloader Tests

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

  // MARK: - contentBuilder Tests

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
