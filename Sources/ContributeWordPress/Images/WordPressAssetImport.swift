import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that holds information about an asset imported from a `WordPressPost`.
public struct WordPressAssetImport: Hashable {
  /// The original URL of the asset.
  public let downloadFromURL: URL

  // TODO: do it once approved
  public let downloadAtURL: URL

  // TODO: do it once approved
  public let featuredPath: String

  /// The id of `WordPressPost` to which the asset belongs.
  public let parentID: Int

  /// Initializes a new `WordPressAssetImport` instance.
  ///
  /// - Parameters:
  ///   - oldURL: The original URL of the asset.
  ///   - parentID: The id of `WordPressPost` to which the asset belongs.
  ///   - newPath: The new path where the asset will be saved.
  internal init(oldURL: URL, newURL: URL, featuredPath: String, parentID: Int) {
    self.downloadFromURL = oldURL
    self.downloadAtURL = newURL
    self.featuredPath = featuredPath
    self.parentID = parentID

    print()
    print("sourceURL: \(self.downloadFromURL.absoluteString)")
    print("destinationURL: \(self.downloadAtURL.absoluteString)")
    print("featuredPath: \(self.featuredPath)")
    print()
  }

  public init?(
    forPost post: WordPressPost,
    sourceURL: URL,
    assetRoot: String,
    resourcePathURL: URL,
    importPathURL: URL?
  ) {
    let directoryPrefix = sourceURL.host?.components(separatedBy: ".").first ?? "default"

    let featuredPath = sourceURL.path
      .replacingOccurrences(
        of: "/wp-content/uploads",
        with: assetRoot
      )
      .replacingOccurrences(of: "//", with: "/")


    let destinationURL = resourcePathURL.appendingPathComponent(featuredPath)

    self.init(
      oldURL: importPathURL?.appendingPathComponent(sourceURL.path) ?? sourceURL,
      newURL: destinationURL,
      featuredPath: featuredPath,
      parentID: post.ID
    )
  }
}
