// swiftlint:disable line_length
// swiftlint:disable force_unwrapping
import Contribute
import ContributeWordPress
import Foundation
import SyndiKit

extension WordPressPost {
  internal static func myYearInReviewPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      postID: 1,
      title: "2018 - My Year in Review",
      contentEncoded: .myYearInReviewContent,
      link: URL(string: "https://leogdion.name/2019/01/14/2018-review/")!,
      description: "My main goal this year was to produce more content online and less time on local events and gatherings. Unfortunately, that wasn't the case.",
      postName: "2018-review",
      categories: tags ?? []
    )
  }

  internal static func areWeThereYetPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      postID: 2,
      title: "Are We There Yet?",
      contentEncoded: .areWeThereYetContent,
      link: URL(string: "https://leogdion.name/2018/12/13/are-we-there-yet/")!,
      postName: "are-we-there-yet",
      categories: tags ?? []
    )
  }

  internal static func fromGoalsToActionsPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      postID: 3,
      title: "From Goals to Actions 2018",
      contentEncoded: .fromGoalsToActionsContent,
      link: URL(string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/")!,
      postName: "from-goals-to-actions-2018",
      categories: tags ?? []
    )
  }

  internal static func podcastingPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      postID: 4,
      title: "Podcasting - Getting Started - Whys and Hows",
      contentEncoded: .podcastingContent,
      link: URL(string: "https://leogdion.name/2019/06/13/podcasting-getting-started-content-recording-audience/")!,
      description: "Generally speaking, podcasting gives specific audiences an in-depth specialized analysis without the need to appeal to the general audience.",
      postName: "podcasting-getting-started-content-recording-audience",
      categories: tags ?? []
    )
  }

  // MARK: - Productivity Apps for Developers (and Everyone Else)

  internal static func productivityAppsPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      postID: 4,
      title: "Productivity Apps for Developers (and Everyone Else)",
      contentEncoded: .productivityContent,
      link: URL(string: "https://leogdion.name/2019/08/01/productivity-apps-for-developers-and-everyone/")!,
      description: "It's important to keep a set of great productivity app which help me optimize rather than distract. Here's a list of productivity apps and services to help you.",
      postName: "productivity-apps-for-developers-and-everyone",
      categories: tags ?? []
    )
  }
}

extension WordPressPost {
  internal static func attachmentA(postID: Int = 1) throws -> WordPressPost {
    try .make(
      postID: postID,
      title: "\(#function)",
      contentEncoded: "",
      type: "attachment"
    )
  }

  internal static func attachmentB(postID: Int = 1) throws -> WordPressPost {
    try .make(
      postID: postID,
      title: "\(#function)",
      contentEncoded: "",
      type: "attachment"
    )
  }

  internal static func attachmentC(postID: Int = 1) throws -> WordPressPost {
    try .make(
      postID: postID,
      title: "\(#function)",
      contentEncoded: "",
      type: "attachment"
    )
  }
}

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
