import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol for generating redirect items from WordPress posts.
public protocol RedirectListGenerator {
  /// Generates redirects from the given WordPress posts.
  ///
  /// - Parameter allPosts: A dictionary of WordPress posts keyed by section name.
  /// - Returns: An array of `RedirectItem` representing the redirects.
  func redirects(fromWordPressPosts allPosts: [SectionName: [WordPressPost]]) -> [RedirectItem]
}

extension RedirectListGenerator {
  /// Generates redirects from the given WordPress posts.
  ///
  /// The generated redirects format is handled by the provided`RedirectFormatter`.
  ///
  /// - Parameters:
  ///   - posts: A dictionary of WordPress posts keyed by section name.
  ///   - formatter: The redirect formatter to use.
  /// - Returns: A string representation of the formatted redirects.
  public func redirects(
    fromPosts posts: [SectionName: [WordPressPost]],
    formattedWith formatter: RedirectFormatter
  ) -> String {
    let redirects = self.redirects(fromWordPressPosts: posts)
    return formatter.formatRedirects(redirects)
  }

  /// Writes the redirects generated from the given WordPress posts to a file
  /// in the specified directory.
  ///
  /// - Parameters:
  ///   - posts: A dictionary of WordPress posts keyed by section name.
  ///   - formatter: The redirect formatter to use.
  ///   - directoryURL: The directory URL where the redirects file should be written.
  /// - Throws: An error if the writing operation fails.
  public func writeRedirects(
    fromPosts posts: [SectionName: [WordPressPost]],
    formattedWith formatter: RedirectFormatter,
    inDirectory directoryURL: URL
  ) throws {
    let redirectsText = redirects(fromPosts: posts, formattedWith: formatter)
    let redirectPath = formatter.redirectsURL(basedOnResourcesDirectoryURL: directoryURL)
    try redirectsText.write(to: redirectPath, atomically: true, encoding: .utf8)
  }
}
