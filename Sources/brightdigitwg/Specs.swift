import Foundation
import Yams
import Publish

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

public struct Post : Codable {
  let frontmatter : Specs
  let content : String
}

extension Post {
  func writeTo(_ file: Path, using encoder: YAMLEncoder, atomically: Bool = true, encoding: String.Encoding = .utf8 ) throws {
    let frontMatter = try encoder.encode(frontmatter).trimmingCharacters(in: .whitespacesAndNewlines)
//
//            let markdownText = markdowns.markdown.trimmingCharacters(in: .whitespacesAndNewlines)
      let text = ["---", frontMatter, "---", content].joined(separator: "\n")
//
    // swiftlint:disable:next force_try
    
    try text.write(toFile: file.absoluteString, atomically: atomically, encoding: encoding)
  }
}
