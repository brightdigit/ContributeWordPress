import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that holds information about an asset imported from a `WordPressPost`.
public struct WordPressAssetImport: Hashable {
  /// The original URL of the asset.
  public let oldURL: URL

  /// The id of `WordPressPost` to which the asset belongs.
  public let parentID: Int?

  /// The new path where the asset will be saved.
  public let newPath: String

  /// Initializes a new `WordPressAssetImport` instance.
  ///
  /// - Parameters:
  ///   - oldURL: The original URL of the asset.
  ///   - parentID: The id of `WordPressPost` to which the asset belongs.
  ///   - newPath: The new path where the asset will be saved.
  internal init(oldURL: URL, parentID: Int?, newPath: String) {
    self.oldURL = oldURL
    self.parentID = parentID
    self.newPath = newPath
  }

  /// Initializes a new `WordPressAssetImport` instance from a WordPress post.
  ///
  /// - Parameters:
  ///   - post: The WordPress post from which to create the asset import.
  ///   - pathFromURL: A closure that generates the new path for the asset based on its URL.
  ///   - urlFromURL: A closure that maps the original asset URL to a new URL, if needed.
  public init?(
    post: WordPressPost,
    oldURLFromURL: (URL) -> URL?,
    newPathFromURL: (URL) -> String
  ) {
    guard post.type == "attachment" else {
      return nil
    }

    guard let attachmentURL = post.attachmentURL else {
      return nil
    }

    let oldURL = oldURLFromURL(attachmentURL) ?? attachmentURL
    let newPath = newPathFromURL(oldURL)

    self.init(
      oldURL: oldURL,
      parentID: post.parentID,
      newPath: newPath
    )
  }

  public init?(
    forPost post: WordPressPost,
    oldUrl: String,
    assetRoot: String,
    assetSiteURL: URL
  ) {
    guard let oldURL = URL(string: oldUrl) else {
      return nil
    }

    self.init(
      oldURL: oldURL,
      parentID: post.ID,
      newPath: oldUrl.replacingOccurrences(
        of: "\(assetSiteURL)/wp-content/uploads",
        with: "/\(assetRoot)/default"
      )
    )
  }
}
