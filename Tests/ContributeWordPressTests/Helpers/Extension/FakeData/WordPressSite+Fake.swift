import ContributeWordPress
import Foundation
import SyndiKit

extension WordPressSite {
  internal static func leogdion() throws -> WordPressSite {
    try .make(
      title: "Leo G Dion",
      link: try .make(string: "https://leogdion.name"),
      description: "Personal Blog",
      categories: [.Uncategorized, .Podcasting, .Productivity, .Software],
      baseSiteURL: URL(string: "https://leogdion.name"),
      baseBlogURL: URL(string: "https://leogdion.name"),
      posts: [
        .areWeThereYetPost(), .fromGoalsToActionsPost(),
        .myYearInReviewPost(), .podcastingPost(), .productivityAppsPost(),
        .attachmentA(), .attachmentB(), .attachmentC()
      ]
    )
  }
}
