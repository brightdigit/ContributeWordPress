import Foundation
import SyndiKit

/// A type that writes redirects from posts into a file.
///
/// It uses an instance of `DynamicRedirectGenerator` to generate redirect items,
/// then using the provided `RedirectFormatter` it formats the redirects into a string
/// whtich later will be written into a file in a given directory.
public struct DynamicRedirectFileWriter: RedirectFileWriter {
  private let generator: RedirectListGenerator
  private let formatter: RedirectFormatter

  public init(
    postFilter: @escaping (WordPressPost) -> Bool,
    urlPathGenerate: @escaping (String, WordPressPost) -> String,
    redirectFromatter: RedirectFormatter
  ) {
    generator = DynamicRedirectGenerator(
      postFilter: postFilter,
      urlPathGenerate: urlPathGenerate
    )
    formatter = redirectFromatter
  }

  public init(
    postFilters: [PostFilter],
    redirectFromatter: RedirectFormatter
  ) {
    generator = DynamicRedirectGenerator(postFilters: postFilters)
    formatter = redirectFromatter
  }

  public init(redirectFromatter: RedirectFormatter) {
    generator = DynamicRedirectGenerator()
    formatter = redirectFromatter
  }

  /// Generates redirects list from WordPress posts per section, then writes
  /// them into a file at the given directory.
  ///
  /// - Parameters:
  ///   - posts: A dictionary of WordPress posts keyed by section name.
  ///   - directoryURL: The directory URL where the redirects file should be written.
  /// - Throws: An error if the writing operation fails.
  public func writeRedirects(
    fromPosts posts: [SectionName: [WordPressPost]],
    inDirectory directoryURL: URL
  ) throws {
    let redirects = generator.redirects(fromWordPressPosts: posts)
    let redirectsText = formatter.formatRedirects(redirects)
    let redirectsPath = formatter.redirectsURL(basedOnResourcesDirectoryURL: directoryURL)
    try redirectsText.write(to: redirectsPath, atomically: true, encoding: .utf8)
  }
}
