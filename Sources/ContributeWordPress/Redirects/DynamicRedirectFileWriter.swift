import Foundation
import SyndiKit

public struct DynamicRedirectFileWriter: RedirectFileWriter {
  private let generator: RedirectListGenerator = DynamicRedirectGenerator()
  private let formatter: RedirectFormatter

  public init(
    redirectFromatter: RedirectFormatter
  ) {
    formatter = redirectFromatter
  }

  // TODO: Please revise this
  /// Writes the redirects generated from the given WordPress posts into a file
  /// in the given directory.
  ///
  /// - Parameters:
  ///   - posts: A dictionary of WordPress posts keyed by section name.
  ///   - formatter: The redirect formatter to use.
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
