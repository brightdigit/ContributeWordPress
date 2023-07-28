import Foundation
import SyndiKit

// TODO: Finish the docs once approved
/// A type that provides dynamic implementation for generating redirects.
///
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
