import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that holds information about an image imported from a `WordPressPost`.
public struct WordPressImageImport: Hashable {
  /// The original URL of the image.
  public let oldURL: URL

  /// The id of `WordPressPost` to which the image belongs.
  public let parentID: Int?

  /// The new path where the image will be saved.
  public let newPath: String

  /// Initializes a new `WordPressImageImport` instance.
  ///
  /// - Parameters:
  ///   - oldURL: The original URL of the image.
  ///   - parentID: The id of `WordPressPost` to which the image belongs.
  ///   - newPath: The new path where the image will be saved.
  internal init(oldURL: URL, parentID: Int?, newPath: String) {
    self.oldURL = oldURL
    self.parentID = parentID
    self.newPath = newPath
  }

  /// Initializes a new `WordPressImageImport` instance from a WordPress post.
  ///
  /// - Parameters:
  ///   - post: The WordPress post from which to create the image import.
  ///   - pathFromURL: A closure that generates the new path for the image based on its URL.
  ///   - urlFromURL: A closure that maps the original image URL to a new URL, if needed.
  public init?(
    post: WordPressPost,
    newPathFromURL: (URL) -> String,
    oldURLFromURL: (URL) -> URL?
  ) {
    guard post.type == "attachment" else {
      return nil
    }

    guard let attachmentURL = post.attachmentURL else {
      return nil
    }

    let oldURL = oldURLFromURL(attachmentURL) ?? attachmentURL

    self.init(
      oldURL: oldURL,
      parentID: post.parentID,
      newPath: newPathFromURL(oldURL)
    )
  }
}
