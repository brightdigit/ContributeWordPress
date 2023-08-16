// swiftlint:disable line_length
// swiftlint:disable force_unwrapping
import Contribute
import ContributeWordPress
import Foundation
import SyndiKit

extension WordPressPost {
  internal static func myYearInReviewPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      title: "2018 - My Year in Review",
      link: URL(string: "https://leogdion.name/2019/01/14/2018-review/")!,
      description: "My main goal this year was to produce more content online and less time on local events and gatherings. Unfortunately, that wasn't the case.",
      postName: "2018-review",
      contentEncoded: .productivityContentEncoded,
      categories: tags ?? []
    )
  }

  internal static func areWeThereYetPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      title: "Are We There Yet?",
      link: URL(string: "https://leogdion.name/2018/12/13/are-we-there-yet/")!,
      postName: "are-we-there-yet",
      contentEncoded: .productivityContentEncoded,
      categories: tags ?? []
    )
  }

  internal static func fromGoalsToActionsPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      title: "From Goals to Actions 2018",
      link: URL(string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/")!,
      postName: "from-goals-to-actions-2018",
      contentEncoded: .productivityContentEncoded,
      categories: tags ?? []
    )
  }

  internal static func podcastingPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      title: "Podcasting - Getting Started - Whys and Hows",
      link: URL(string: "https://leogdion.name/2019/06/13/podcasting-getting-started-content-recording-audience/")!,
      description: "Generally speaking, podcasting gives specific audiences an in-depth specialized analysis without the need to appeal to the general audience.",
      postName: "podcasting-getting-started-content-recording-audience",
      contentEncoded: .productivityContentEncoded,
      categories: tags ?? []
    )
  }

  internal static func productivityAppsPost(tags: [RSSItemCategory]? = nil) throws -> WordPressPost {
    try make(
      title: "Productivity Apps for Developers (and Everyone Else)",
      link: URL(string: "https://leogdion.name/2019/08/01/productivity-apps-for-developers-and-everyone/")!,
      description: "It's important to keep a set of great productivity app which help me optimize rather than distract. Here's a list of productivity apps and services to help you.",
      postName: "productivity-apps-for-developers-and-everyone",
      contentEncoded: .productivityContentEncoded,
      categories: tags ?? []
    )
  }

  internal static func make(
    title: String,
    link: URL = .diagramForGoalsLink,
    description: String? = nil,
    guid: EntryID = .diagramForGoalsEntryID,
    type: String = "post",
    postName: String = "post-name",
    pubDate: Date? = Date(),
    postDate: Date? = Date(),
    contentEncoded: String? = nil,
    categories: [RSSItemCategory] = [.Podcasting, .Productivity],
    creators: [String] = ["Leo"],
    status: String = "publish"
  ) throws -> WordPressPost {
    try .init(
      item: .make(
        title: title,
        link: link,
        description: description,
        guid: guid,
        type: type,
        postName: postName,
        pubDate: pubDate,
        contentEncoded: contentEncoded,
        postDate: postDate,
        categories: categories,
        creators: creators,
        status: status
      )
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
