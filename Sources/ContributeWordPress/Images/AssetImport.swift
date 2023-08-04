import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that holds information about an asset imported from a `WordPressPost`.
public struct AssetImport: Hashable {
  /// The source `URL` from where asset will be imported.
  public let fromURL: URL

  /// The destination `URL` to where asset will be imported.
  public let atURL: URL

  /// The featured path for the asset.
  public let featuredPath: String

  /// The ID of `WordPressPost` to which the asset belongs.
  public let parentID: Int

  /// Initializes a new `AssetImport` instance.
  ///
  /// - Parameters:
  ///   - importFromURL: The source URL of the asset.
  ///   - importAtURL: The destination URL to where the asset will be imported.
  ///   - featuredPath: The featured path for the asset.
  ///   - parentID: The ID of the `WordPressPost` to which the asset belongs.
  internal init(
    importFromURL: URL,
    importAtURL: URL,
    featuredPath: String,
    parentID: Int
  ) {
    fromURL = importFromURL
    atURL = importAtURL
    self.featuredPath = featuredPath
    self.parentID = parentID
  }

  /// Initializes a new `AssetImport` instance for a `WordPressPost`.
  ///
  /// - Parameters:
  ///   - post: The `WordPressPost` instance.
  ///   - sourceURL: The source URL from where the asset will be imported.
  ///   - assetRoot: The root path for the assets.
  ///   - resourcesPathURL: The URL of the resources path.
  ///   - importPathURL: The URL of the import path.
  public init(
    forPost post: WordPressPost,
    sourceURL: URL,
    assetRoot: String,
    resourcesPathURL: URL,
    importPathURL: URL?
  ) {
    let featuredPath = sourceURL.path
      .replacingOccurrences(
        of: ["", WordPressSite.wpContentUploadsRelativePath].joined(separator: "/"),
        with: assetRoot
      )
      .replacingOccurrences(of: "//", with: "/")

    let destinationURL = resourcesPathURL.appendingPathComponent(featuredPath)

    self.init(
      importFromURL: importPathURL?.appendingPathComponent(sourceURL.path) ?? sourceURL,
      importAtURL: destinationURL,
      featuredPath: featuredPath,
      parentID: post.ID
    )
  }
}
