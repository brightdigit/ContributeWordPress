import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that decodes WordPress export files using the `SynDecoder`.
public struct PostsExportSynDecoder: PostsExportDecoder {
  /// The decoder used to decode the WordPress export file.
  private let decoder: WordPressDecoder = SynDecoder()

  /// Returns an array of URLs for all of the files in the given directory.
  // swiftlint:disable:next line_length
  private let fileURLsFromDirectory: (_ atDirectory: URL) throws -> [URL] = Self.defaultFileURLs(atDirectory:)

  /// Returns the last path component of the given URL without its extension.
  /// This will be the section id for all posts found in the export file at given URL.
  private let keyFromURL: (URL) -> String = { $0.lastPathComponentWithoutExtension() }

  public init() {}

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
  /// - Parameter directoryURL: The URL of the directory containing the exports.
  /// - Returns: A dictionary of WordPress posts keyed by section name.
  /// - Throws: An error if posts couldn't be extracted from any of the export files.
  public func posts(
    fromExportsAt directoryURL: URL
  ) throws -> [SectionName: [WordPressPost]] {
    let files = try fileURLsFromDirectory(directoryURL)

    let feedPairs = try files.map { url -> (String, [WordPressPost]?) in
      try (self.keyFromURL(url), Self.postsFromURL(url, using: decoder))
    }

    return Dictionary(feedPairs, uniquingKeysWith: Array.combine).compactMapValues { $0 }
  }
}

extension PostsExportSynDecoder {
  /// A default logic for finding all files found at given directory.
  ///
  /// If the `directoryURL` is not valid directory, this method
  /// throws `ImportError.directory(:_)` error.
  ///
  /// - Parameter directoryURL: The directory URL.
  /// - Returns: An array of export file URLs that can be found in the given directory.
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
}
