import Contribute
import Foundation

import Yams

public struct Specs: Codable {
  public init(title: String, date: Date, description: String?, tags: [String], featuredImage: String?) {
    self.title = title
    self.date = YAML.dateFormatter.string(from: date)
    self.description = description
    self.tags = tags.isEmpty ? nil : tags.joined(separator: ", ")
    self.featuredImage = featuredImage
  }

  let title: String
  let date: String
  let description: String?
  let tags: String?
  let featuredImage: String?
}

public extension Specs {
  init(from source: WordPressSource) {
    self.init(
      title: source.post.title.fixUnicodeEscape().dequote(),
      date: source.post.postDate,
      description: source.post.meta["_yoast_wpseo_metadesc"]?.fixUnicodeEscape().dequote(),
      tags: source.post.tags, featuredImage: source.featuredImage
    )
  }
}
