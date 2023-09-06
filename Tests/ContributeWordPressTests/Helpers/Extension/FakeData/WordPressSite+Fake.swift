import ContributeWordPress
import Foundation
import SyndiKit

extension WordPressSite {
  internal static func leogdion() throws -> WordPressSite {
    try .make(
      title: "Leo G Dion",
      link: URL("https://leogdion.name"),
      description: "Personal Blog",
      categories: [
        .init(termID: 1, niceName: "uncategorized", parent: "", name: "Uncategorized")
      ],
      tags: leogdionTags(),
      baseSiteURL: URL("https://leogdion.name"),
      baseBlogURL: URL("https://leogdion.name"),
      posts: try leogdionPosts()
    )
  }

  private static func leogdionTags() -> [WordPressElements.Tag] {
    [
      .init(termID: 4, slug: "podcasting", name: "podcasting"),
      .init(termID: 5, slug: "productivity", name: "productivity"),
      .init(termID: 6, slug: "software", name: "software")
    ]
  }

  private static func leogdionPosts() throws -> [WordPressPost] {
    try [
      .areWeThereYetPost(),
      .fromGoalsToActionsPost(),
      .myYearInReviewPost(),
      .podcastingPost(),
      .productivityAppsPost(),
      .attachmentA(),
      .attachmentB(),
      .attachmentC()
    ]
  }
}
