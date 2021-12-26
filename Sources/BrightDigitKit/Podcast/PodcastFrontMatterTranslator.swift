import Foundation

public struct PodcastFrontMatterTranslator: FrontMatterTranslator {
  public func frontMatter(from source: Episode) -> PodcastFrontMatter {
    PodcastFrontMatter(episode: source)
  }

  public typealias FrontMatterType = PodcastFrontMatter

  public typealias SourceType = Episode

  public struct PodcastFrontMatter: Codable {
    let title: String
    let date: String
    let description: String
    let featuredImage: URL
    let youtubeID: String
    let audioDuration: Int
    let videoDuration: Int

    public init(episode: Episode) {
      date = YAML.dateFormatter.string(from: episode.date)
      title = episode.title
      description = episode.summary
      audioDuration = Int(episode.duration)
      videoDuration = Int(episode.video.duration)
      featuredImage = episode.imageURL
      youtubeID = episode.video.youtubeID
    }
  }
}
