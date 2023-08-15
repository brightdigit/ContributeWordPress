import Foundation
import SyndiKit

/// A type that matches WordPress posts with a given keyPath
/// that matches a regular expression pattern.
public struct RegexKeyPostFilter: PostFilter {
  /// The regular expression that is used to match posts.
  private let regex: NSRegularExpression

  /// The keyPath on the WordPress post object to filter by.
  private let keyPath: KeyPath<WordPressPost, String>

  /// Whether the match should be excluded or included.
  private let not: Bool

  /// Initializes a new `RegexKeyPostFilter` instance.
  ///
  /// - Parameters:
  ///   - pattern: The regular expression pattern as string.
  ///   - keyPath: The keyPath on the WordPress post object to filter by.
  ///   - not: Whether the match should be excluded or included.
  /// - Throws: An error if the provided regular expression pattern is invalid.
  public init(
    pattern: String,
    keyPath: KeyPath<WordPressPost, String>,
    not: Bool = false
  ) throws {
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    self.init(regex: regex, keyPath: keyPath, not: not)
  }

  /// Initializes a new `RegexKeyPostFilter` instance.
  ///
  /// - Parameters:
  ///   - pattern: The regular expression object.
  ///   - keyPath: The keyPath on the WordPress post object to filter by.
  ///   - not: Whether the match should be excluded or included.
  internal init(
    regex: NSRegularExpression,
    keyPath: KeyPath<WordPressPost, String>,
    not: Bool = false
  ) {
    self.regex = regex
    self.keyPath = keyPath
    self.not = not
  }

  /// Returns `true` if the post matches the regular expression, and `false` otherwise.
  ///
  /// - Parameters:
  ///   - post: The WordPressPost object being evaluated.
  /// - Returns: A boolean value indicating whether the keyPath on the WordPress
  ///            post matches the regular expression or not.
  public func include(_ post: WordPressPost) -> Bool {
    let string = post[keyPath: keyPath]
    let range = NSRange(string.startIndex ..< string.endIndex, in: string)
    return (regex.firstMatch(in: string, options: [], range: range) != nil) != not
  }
}
