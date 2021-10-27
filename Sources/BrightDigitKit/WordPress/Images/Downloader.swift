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

    guard let oldURL = post.attachmentURL else {
      return nil
    }

    self.oldURL = urlFromURL(oldURL) ?? oldURL
    newPath = pathFromURL(self.oldURL)
    parentID = post.parentID
  }

  let oldURL: URL
  let parentID: Int?
  let newPath: String
}

public protocol Downloader {
  func download(fromPosts posts: [WordPressPost], to resourceImagePath: URL, dryRun: Bool, allowsOverwrites: Bool) throws -> [WordPressImageImport]
}
