@testable import ContributeWordPress
import XCTest

internal final class SitesExportSynDecoderTests: XCTestCase {
  private let fileManager: FileManager = .default
  private let testDir = URL.temporaryDirURL
    .appendingPathComponent("test", isDirectory: true)

  // MARK: - fileURLsFromDirectory Tests

  internal func testDefaultFileURLsAtDirectory() throws {
    let expectedFileURLs: [URL] = (1 ... 2)
      .compactMap { testDir.appendingPathComponent("file\($0).xml") }

    try createFiles(expectedFileURLs, with: "some content", atDirectory: testDir)

    let actualFileURLs = SitesExportSynDecoder.defaultFileURLs(atDirectory: testDir)
      .map {
        var fileURL = $0
        fileURL.resolveSymlinksInPath()
        return fileURL
      }

    XCTAssertEqual(actualFileURLs.count, expectedFileURLs.count)

    for expectedFileURL in expectedFileURLs {
      XCTAssertTrue(actualFileURLs.contains(expectedFileURL))
    }
  }

  internal func testSuccessfulFileURLsFromDirectory() throws {
    let spy = FileURLFromDirectorySpy(.success(()))

    let sut = SitesExportSynDecoder(
      fileURLsFromDirectory: spy.fileURLsFromDirectory(_:)
    )

    _ = try sut.sites(fromExportsAt: .temporaryDirURL)

    XCTAssertTrue(spy.fromDirectoryIsCalled)
  }

  internal func testFailedFileURLsFromDirectory() throws {
    let spy = FileURLFromDirectorySpy(.failure(.fileURLsFromDirectory))

    let sut = SitesExportSynDecoder(
      fileURLsFromDirectory: spy.fileURLsFromDirectory(_:)
    )

    assertThrowableBlock(
      expectedError: SitesExportSynDecoderError.fileURLsFromDirectory,
      try sut.sites(fromExportsAt: .temporaryDirURL)
    )
  }

  // MARK: - keyFromURL Tests

  internal func testFailedKeyFromURL() throws {
    let spy = KeyFromURLSpy()

    let sut = SitesExportSynDecoder(
      keyFromURL: spy.keyFromURL(_:)
    )

    try createFiles(
      [testDir.appendingPathComponent("fake.xml")],
      with: "some content",
      atDirectory: testDir
    )

    XCTAssertThrowsError(try sut.sites(fromExportsAt: .temporaryDirURL))
  }

  // MARK: - Helpers

  private func createFiles(
    _ files: [URL],
    with content: String,
    atDirectory: URL
  ) throws {
    try fileManager.removeItem(at: atDirectory)

    try fileManager.createDirectory(
      at: atDirectory,
      withIntermediateDirectories: true
    )

    try files.forEach { file in
      try content.data(using: .utf8)?.write(to: file)
    }
  }
}
