import Contribute
import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that decodes WordPress export files using the `SynDecoder`.
public struct SitesExportSynDecoder: SitesExportDecoder {
  /// The decoder used to decode the WordPress export file.
  private let decoder: WordPressDecoder = SynDecoder()

  /// Returns an array of URLs for all of the files in the given directory.
  private let fileURLsFromDirectory: (URL) throws -> [URL]

  /// Returns the last path component of the given URL without its extension.
  /// This will be the section id for all posts found in the export file at given URL.
  private let keyFromURL: (URL) -> String

  public init(
    fileURLsFromDirectory: @escaping (URL) throws -> [URL] =
      Self.defaultFileURLs(atDirectory:),
    keyFromURL: @escaping (URL) -> String = { $0.lastPathComponentWithoutExtension() }
  ) {
    self.fileURLsFromDirectory = fileURLsFromDirectory
    self.keyFromURL = keyFromURL
  }

  /// The method decodes `WordPressSite` from the given file URL.
  ///
  /// - Parameters:
  ///   - url: The URL of export file containing the WordPress site with its posts.
  ///   - decoder: The WordPress decoder.
  /// - Returns: The decoded WordPress site, or nil if decoding failed.
  /// - Throws: An error of site couldn't be decoded from the given file..
  private static func siteFromURL(
    _ url: URL,
    using decoder: WordPressDecoder
  ) throws -> WordPressSite? {
    let data = try Data(contentsOf: url)
    return try decoder.decodeSites(fromData: data, allowInvalidCharacters: true)
  }

  /// Returns a dictionary of WordPress sites keyed by filename.
  ///
  /// - Parameter directoryURL: The URL of the directory containing the exports.
  /// - Returns: A dictionary of WordPress sites keyed by section name.
  /// - Throws: An error if sites couldn't be extracted from any of the export files.
  public func sites(
    fromExportsAt directoryURL: URL
  ) throws -> [SectionName: WordPressSite] {
    let files = try fileURLsFromDirectory(directoryURL)

    let feedPairs = try files.map { url -> (String, WordPressSite?) in
      try (self.keyFromURL(url), Self.siteFromURL(url, using: decoder))
    }

    return Dictionary(uniqueKeysWithValues: feedPairs).compactMapValues { $0 }
  }
}

extension SitesExportSynDecoder {
  /// A default logic for finding all files at given directory.
  ///
  /// - Parameter directoryURL: The directory URL.
  /// - Returns: An array of URLs for export files found in the given directory.
  public static func defaultFileURLs(atDirectory directoryURL: URL) -> [URL] {
    let enumerator = FileManager.default.enumerator(
      at: directoryURL,
      includingPropertiesForKeys: nil
    )

    guard let enumerator = enumerator else {
      assertionFailure("\(directoryURL) returned empty enumerator.")
      return []
    }

    return enumerator.compactMap { $0 as? URL }
  }
}
