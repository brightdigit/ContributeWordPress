import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct PostsExportSynDecoder: PostsExportDecoder {
  let decoder: WordPressDecoder = SynDecoder()
  let fileURLFromDirectory: (URL) throws -> [URL] = Self.defaultFileURLs(atDirectory:)
  let keyFromURL: (URL) -> String = { $0.lastPathComponentWithoutExtension() }

  static func defaultFileURLs(atDirectory directoryURL: URL) throws -> [URL] {
    guard let enumerator = FileManager.default.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else {
      throw ImportError.directory(directoryURL)
    }

    return enumerator.compactMap { $0 as? URL }
  }

  fileprivate static func postsFromURL(_ url: URL, using decoder: WordPressDecoder) throws -> [WordPressPost]? {
    let data = try Data(contentsOf: url)
    return try decoder.decodePosts(fromData: data, allowInvalidCharacters: true)
  }

  public func posts(fromExportsAt directoryURL: URL) throws -> [String: [WordPressPost]] {
    let files = try fileURLFromDirectory(directoryURL)

    let feedPairs = try files.map { url -> (String, [WordPressPost]?) in
      try (self.keyFromURL(url), Self.postsFromURL(url, using: decoder))
    }

    return Dictionary(feedPairs, uniquingKeysWith: Array.combine).compactMapValues { $0 }
  }
}
