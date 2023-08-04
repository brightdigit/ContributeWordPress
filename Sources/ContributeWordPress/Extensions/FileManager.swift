import Foundation

extension FileManager {
  /// Creates a directory with the given name in the specified content path URL.
  ///
  /// - Parameters:
  ///   - directoryName: The name of the directory to create.
  ///   - contentPathURL: The content path URL.
  /// - Throws: An error if the directory creation fails.
  internal static func createDirectory(
    withName directoryName: String,
    in pathURL: URL
  ) throws {
    let directoryURL = pathURL.appendingPathComponent(
      directoryName,
      isDirectory: true
    )

    if !FileManager.default.fileExists(atPath: directoryURL.path) {
      try FileManager.default.createDirectory(
        at: directoryURL,
        withIntermediateDirectories: true
      )
    }
  }
}
