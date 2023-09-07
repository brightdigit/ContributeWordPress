import Contribute
import SyndiKit

extension WordPressPost {
  internal var tagsString: String? {
    let tags = tags.joined(separator: ", ")
      .trimmingCharacters(in: .whitespacesAndNewlines)

    return tags.isEmpty ? nil : tags
  }

  internal var postDateString: String {
    YAML.dateFormatter.string(from: postDate)
  }
}
