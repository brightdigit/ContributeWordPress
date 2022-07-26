import Foundation

extension Product {
  static let orchardnest: Product =
    .init(title: "OrchardNest", description: """
     ### Your source for Apple and Swift-related news, tutorials, podcasts, YouTube videos and more!

     OrchardNest aggregates, filters, curates the RSS feeds from developers, designers, podcasters, YouTubers and newsletters in the Apple and Swift development space.
    """, style: .portrait, screenshots: [
      .at(path: "articles.jpg"),
      .at(path: "videos.jpg"),
      .at(path: "podcasts.jpg")
    ], platforms: [.web], technologies: [.vapor, .postgreSQL], productURL: "https://orchardnest.com")
}
