import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct WordPressImageImport: Hashable {
  public let oldURL: URL
  public let parentID: Int?
  public let newPath: String

  internal init(oldURL: URL, parentID: Int?, newPath: String) {
    self.oldURL = oldURL
    self.parentID = parentID
    self.newPath = newPath
  }

  public init?(
    post: WordPressPost,
    pathFromURL: (URL) -> String,
    urlFromURL: (URL) -> URL?
  ) {
    guard post.type == "attachment" else {
      return nil
    }

    guard let attachmentURL = post.attachmentURL else {
      return nil
    }

    let oldURL = urlFromURL(attachmentURL) ?? attachmentURL

    self.init(
      oldURL: oldURL,
      parentID: post.parentID,
      newPath: pathFromURL(oldURL)
    )
  }
}
