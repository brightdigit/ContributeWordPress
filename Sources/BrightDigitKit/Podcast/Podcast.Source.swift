import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public extension Podcast {
  struct Source {
    public init(episodeNo: Int, slug: String, title: String, date: Date, summary: String, content: String, audioURL: URL, imageURL: URL, duration: TimeInterval, transistorID: String, video: Video) {
      self.episodeNo = episodeNo
      self.slug = slug
      self.title = title
      self.date = date
      self.summary = summary
      self.content = content
      self.audioURL = audioURL
      self.imageURL = imageURL
      self.duration = duration
      self.video = video
      self.transistorID = transistorID
    }

    public let episodeNo: Int
    public let slug: String
    public let title: String
    public let date: Date
    public let summary: String
    public let content: String
    public let audioURL: URL
    public let imageURL: URL
    public let duration: TimeInterval
    public let video: Video
    public let transistorID: String
  }
}

public extension Podcast.Source {
  init(item: RSSItem, video: Video) throws {
    let content = item.contentEncoded?.value ?? item.description.value

    guard item.link.host == "share.transistor.fm" else {
      throw BrightDigitKit.ImportError.invalidPodcastEpisodeFromRSSItem(item)
    }
    let transistorID = item.link.lastPathComponent
    guard let date = item.published else {
      throw BrightDigitKit.ImportError.invalidPodcastEpisodeFromRSSItem(item)
    }

    guard case let .podcast(episode) = item.media else {
      throw BrightDigitKit.ImportError.invalidPodcastEpisodeFromRSSItem(item)
    }

    guard let duration = episode.duration else {
      throw BrightDigitKit.ImportError.missingFieldFromPodcastEpisode(episode, .duration)
    }

    guard let title = episode.title else {
      throw BrightDigitKit.ImportError.missingFieldFromPodcastEpisode(episode, .title)
    }

    guard let episodeNo = episode.episode else {
      throw BrightDigitKit.ImportError.missingFieldFromPodcastEpisode(episode, .episode)
    }

    guard let summary = episode.summary ?? episode.subtitle else {
      throw BrightDigitKit.ImportError.missingFieldFromPodcastEpisode(episode, .summary)
    }

    guard let imageURL = episode.image?.href else {
      throw BrightDigitKit.ImportError.missingFieldFromPodcastEpisode(episode, .imageHref)
    }

    let slug = try title.convertedToSlug()

    self.init(episodeNo: episodeNo, slug: slug, title: title, date: date, summary: summary, content: content, audioURL: imageURL, imageURL: imageURL, duration: duration, transistorID: transistorID, video: video)
  }

  static func episodesBasedOn(rssItems: [RSSItem], withVideos videos: [String: Video]) throws -> [Podcast.Source] {
    try rssItems.map { rssItem in
      let title = rssItem.title.trimmingCharacters(in: .whitespacesAndNewlines)
      guard let video = videos[title] else {
        throw ImportError.missingVideoForEpisode(rssItem)
      }
      return try .init(item: rssItem, video: video)
    }
  }
}
