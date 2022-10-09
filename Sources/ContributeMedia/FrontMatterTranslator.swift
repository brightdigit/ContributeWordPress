import Contribute
import Foundation
public extension Podcast {
  struct FrontMatterTranslator: Contribute.FrontMatterTranslator {
    public func frontMatter(from source: Source) -> FrontMatter {
      FrontMatter(episode: source)
    }

    public typealias FrontMatterType = FrontMatter

    public typealias SourceType = Source

    public init() {}
    public struct FrontMatter: Codable {
      let title: String
      let date: String
      let description: String
      let featuredImage: URL
      let youtubeID: String
      let audioDuration: Int
      let videoDuration: Int
      let podcastID: String

      public init(episode: Source) {
        date = YAML.dateFormatter.string(from: episode.date)
        title = episode.title
        description = episode.summary
        audioDuration = Int(episode.duration)
        videoDuration = Int(episode.video.duration)
        featuredImage = episode.imageURL
        youtubeID = episode.video.youtubeID
        podcastID = episode.podcastID
      }
    }
  }
}
