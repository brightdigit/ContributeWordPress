import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol Downloader {
  func download(fromPosts posts: [WordPressPost], to resourceImagePath: URL) throws
}
