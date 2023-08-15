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

  public func writeRedirects(
    fromSites sites: [SectionName: WordPressSite],
    inDirectory directoryURL: URL
  ) throws {
    let redirects = generator.redirects(fromSites: sites)
    let redirectsText = formatter.formatRedirects(redirects)
    let redirectsPath = formatter.redirectsURL(basedOnResourcesDirectoryURL: directoryURL)
    try redirectsText.write(to: redirectsPath, atomically: true, encoding: .utf8)
  }
}
