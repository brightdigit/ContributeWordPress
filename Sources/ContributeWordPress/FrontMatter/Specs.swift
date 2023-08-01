import Contribute
import Foundation

import Yams

/// A type that represents the front matter for a WordPress post.
public struct Specs: Codable {
  /// The title of the post.
  public let title: String

  /// The date of the post.
  public let date: String

  /// The description of the post.
  public let description: String?

  /// The tags for the post.
  public let tags: String?

  /// The featured image for the post
  public let featuredImage: String?

  /// Initializes a new `Specs` instance.
  ///
  /// - Parameters:
  ///   - title: The title of the post.
  ///   - date: The date of the post.
  ///   - description: The description of the post.
  ///   - tags: The tags for the post.
  ///   - featuredImage: The featured image for the post.
  public init(
    title: String,
    date: Date,
    description: String?,
    tags: [String],
    featuredImage: String?
  ) {
    self.title = title
    self.date = YAML.dateFormatter.string(from: date)
    self.description = description
    self.tags = tags.isEmpty ? nil : tags.joined(separator: ", ")
    self.featuredImage = featuredImage
  }
}

extension Specs {
  /// Initializes a new `Specs` isntance from a WordPress source.
  ///
  /// - Parameter source: The WordPress source.
  public init(from source: Source) {
    self.init(
      title: source.post.title.fixUnicodeEscape().dequote(),
      date: source.post.postDate,
      description: source.post.meta["_yoast_wpseo_metadesc"]?
        .fixUnicodeEscape()
        .dequote(),
      tags: source.post.tags,
      featuredImage: source.featuredImage
    )
  }
}
