import Contribute
import Foundation
import SyndiKit

/// A type that represents a source for a WordPress post.
public struct Source {
  /// The name of the section to which the post belongs.
  public let sectionName: String

  /// The WordPress object containing the contents of the post.
  public let post: WordPressPost

  /// Optional URL string pointing to the featured image of the post.
  public let featuredImage: String?

  /// Optional closure to get html string from the post.
  public var htmlFromPost: ((WordPressPost) -> String)?
}

extension Source: HTMLSource {
  /// The HTML body of the WordPress post.
  public var html: String {
    htmlFromPost?(post) ?? post.body
  }
}