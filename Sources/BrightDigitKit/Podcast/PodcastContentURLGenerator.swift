import Foundation

public struct PodcastContentURLGenerator: ContentURLGenerator {
  public func destinationURL(basedOn episode: Episode, atContentPathURL url: URL) -> URL {
    url.appendingPathComponent("\(episode.episodeNo.description.padLeft(totalWidth: 3, byString: "0")).\(episode.slug)").appendingPathExtension("md")
  }

  public typealias SourceType = Episode
}
