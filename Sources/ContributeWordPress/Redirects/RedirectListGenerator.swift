import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public protocol RedirectListGenerator {
  func redirects(fromWordPressPosts allPosts: [String: [WordPressPost]]) -> [RedirectItem]
}

extension RedirectListGenerator {
  public func redirects(fromPosts posts: [String: [WordPressPost]], formattedWith formatter: RedirectFormatter) -> String {
    let redirects = self.redirects(fromWordPressPosts: posts)
    return formatter.formatRedirects(redirects)
  }

  public func writeRedirects(fromPosts posts: [String: [WordPressPost]], formattedWith formatter: RedirectFormatter, inDirectory directoryURL: URL) throws {
    let redirectsText = redirects(fromPosts: posts, formattedWith: formatter)
    let redirectPath = formatter.redirectsURL(basedOnResourcesDirectoryURL: directoryURL)
    try redirectsText.write(to: redirectPath, atomically: true, encoding: .utf8)
  }
}
