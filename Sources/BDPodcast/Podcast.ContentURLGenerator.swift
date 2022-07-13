import BDContent
import Foundation
public extension Podcast {
  struct ContentURLGenerator: BDContent.ContentURLGenerator {
    public func destinationURL(basedOn episode: Source, atContentPathURL url: URL) -> URL {
      url.appendingPathComponent("\(episode.episodeNo.description.padLeft(totalWidth: 3, byString: "0"))-\(episode.slug)").appendingPathExtension("md")
    }

    public init() {}
    public typealias SourceType = Source
  }
}
