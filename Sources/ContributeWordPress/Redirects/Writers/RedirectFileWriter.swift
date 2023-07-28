import Foundation
import SyndiKit

/// A protocol for writing redirect items from WordPress posts.
public protocol RedirectFileWriter {
  /// Generates redirects list from WordPress posts per section, then writes
  /// them into a file at the given directory.
  ///
  /// - Parameters:
  ///   - posts: A dictionary of WordPress posts keyed by section name.
  ///   - directoryURL: The directory URL where the redirects file should be written.
  /// - Throws: An error if the writing operation fails.
  func writeRedirects(
    fromPosts posts: [SectionName: [WordPressPost]],
    inDirectory directoryURL: URL
  ) throws
}
