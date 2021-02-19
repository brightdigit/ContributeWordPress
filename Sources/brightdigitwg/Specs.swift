import Foundation

public struct Specs: Codable {
  public init(date: Date, description: String?, tags: [String]) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = .current
    self.date = dateFormatter.string(from: date)
    self.description = description
    self.tags = tags.isEmpty ? nil : tags.joined(separator: ", ")
  }

  let date: String
  let description: String?
  let tags: String?
}

public extension Specs {
  init(fromPost post: WordpressPost) {
    self.init(date: post.date, description: post.meta["_yoast_wpseo_metadesc"], tags: post.tags)
  }
}
