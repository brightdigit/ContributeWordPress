import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct WordPressImageImport: Hashable {
  internal init(oldURL: URL, parentID: Int?, newPath: String) {
    self.oldURL = oldURL
    self.parentID = parentID
    self.newPath = newPath
  }

  init?(post: WordPressPost, pathFromURL: (URL) -> String, urlFromURL: (URL) -> URL?) {
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

  let oldURL: URL
  let parentID: Int?
  let newPath: String
}

public protocol Downloader {
  func download(fromPosts posts: [WordPressPost], to resourceImagePath: URL, dryRun: Bool, allowsOverwrites: Bool) throws -> [WordPressImageImport]
}
