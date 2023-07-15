import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that decodes WordPress xml files using the `SynDecoder`.
public struct PostsExportSynDecoder: PostsExportDecoder {
  /// The decoder used to decode the WordPress xml file.
  private let decoder: WordPressDecoder = SynDecoder()

  /// Returns an array of URLs for all of the files in the given directory.
  // swiftlint:disable:next line_length
  private let fileURLFromDirectory: (URL) throws -> [URL] = Self.defaultFileURLs(atDirectory:)

  /// Returns the last path component of the given URL without its extension.
  private let keyFromURL: (URL) -> String = { $0.lastPathComponentWithoutExtension() }

  /// Returns an array of `URL` for files found at the given directory.
  ///
  /// If the `directoryURL` is not valid directory, this method
  /// throws `ImportError.directory(:_)` error.
  ///
  /// - Parameter directoryURL: The directory URL.
  /// - Returns: An array of file URLs, or `nil` if the directory could not be read.
  /// - Throws: An error if the directory could not be enumerated.
  private static func defaultFileURLs(atDirectory directoryURL: URL) throws -> [URL] {
    let enumerator = FileManager.default.enumerator(
      at: directoryURL,
      includingPropertiesForKeys: nil
    )

    guard let enumerator = enumerator else {
      throw ImportError.directory(directoryURL)
    }

    return enumerator.compactMap { $0 as? URL }
  }

  /// The method decodes posts from the given file URL.
  ///
  /// - Parameters:
  ///   - url: The URL of file containing WordPress posts to be decoded.
  ///   - decoder: The WordPress decoder.
  /// - Returns: An array of WordPress posts.
  /// - Throws: An error of posts couldn't be decoded from the given file..
  private static func postsFromURL(
    _ url: URL,
    using decoder: WordPressDecoder
  ) throws -> [WordPressPost]? {
    let data = try Data(contentsOf: url)
    return try decoder.decodePosts(fromData: data, allowInvalidCharacters: true)
  }

  /// Returns a dictionary of WordPress posts keyed by filename.
  ///
  /// - Parameter directoryURL: The directory URL.
  /// - Returns: A dictionary of filenames keys to lists of WordPress posts.
  /// - Throws: An error if couldn't get the list of files at the given directory.
  public func posts(fromExportsAt directoryURL: URL) throws -> [String: [WordPressPost]] {
    let files = try fileURLFromDirectory(directoryURL)

    let feedPairs = try files.map { url -> (String, [WordPressPost]?) in
      try (self.keyFromURL(url), Self.postsFromURL(url, using: decoder))
    }

    return Dictionary(feedPairs, uniquingKeysWith: Array.combine).compactMapValues { $0 }
  }
}
