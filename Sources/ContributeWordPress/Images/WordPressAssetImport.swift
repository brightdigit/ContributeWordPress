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

  public init?(
    forPost post: WordPressPost,
    oldUrl: String,
    assetRoot: String,
    assetSiteURL: URL
  ) {
    guard let oldURL = URL(string: oldUrl) else {
      return nil
    }

    #warning("SHENDY: Why is it using `default`? There are insances of multiple sites using a multi site in wp. That's what BrightDigit was.")
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
