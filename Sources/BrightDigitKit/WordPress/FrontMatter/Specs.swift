import Foundation
import SyndiKit
public struct Specs: Codable {
  public init(title: String, date: Date, description: String?, tags: [String], featuredImage: String?) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = .current
    self.title = title
    self.date = dateFormatter.string(from: date)
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
  init(fromPost post: WordPressPost, withFeaturedImage featuredImage: String?) {
    self.init(title: post.title, date: post.postDate, description: post.meta["_yoast_wpseo_metadesc"], tags: post.tags, featuredImage: featuredImage)
  }
}
