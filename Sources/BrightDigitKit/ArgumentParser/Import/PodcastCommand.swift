import ArgumentParser
import Foundation
import Prch
import SwiftTube
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

typealias PodcastEpisode = BrightDigitKit.Podcast.Source
typealias PodcastEpisodeVideo = BrightDigitKit.Podcast.Source.Video

public extension BrightDigitSiteCommand.ImportCommand {
  struct Podcast: ParsableCommand {
    public static var configuration = CommandConfiguration(
      commandName: "podcast",
      abstract: "Command for importing a podcast into the BrightDigit site."
    )

    public init() {}

    @Option
    public var playlistID: String = "PLmpJxPaZbSnBvpnEdaX78wSM1d9BVvMfI"

    @Option
    public var youtubeAPIKey: String

    @Option
    public var rss = URL(string: "https://feeds.transistor.fm/empowerapps-show")!

    @Option(help: "Destination directory for markdown files.")
    public var exportMarkdownDirectory: String

    @Flag
    public var overwriteExisting: Bool = false

    @Flag
    public var includeMissingPrevious: Bool = false

    var contentPathURL: URL {
      URL(fileURLWithPath: exportMarkdownDirectory)
    }

    public static func rssItemsFrom(_ rssURL: URL) throws -> [RSSItem] {
      let decoder = SynDecoder()
      let data = try Data(contentsOf: rssURL)
      let synfeed = try decoder.decode(data)
      guard let rssFeed = synfeed as? RSSFeed else {
        throw BrightDigitKit.ImportError.invalidRSS(rssURL)
      }
      return rssFeed.channel.items
    }

    public func run() throws {
      let youtubeClient = Prch.Client(api: YouTube.API(), session: URLSession.shared)
      let videos = try youtubeClient.videos(fromRequest: .init(apiKey: youtubeAPIKey, playlistID: playlistID))
      let videoDurations = try PodcastEpisodeVideo.dictionaryBasedOn(videos: videos)
      let rssItems = try Self.rssItemsFrom(rss)

      let options: MarkdownContentBuilderOptions = .init(shouldOverwriteExisting: overwriteExisting, includeMissingPrevious: includeMissingPrevious)
      let episodes: [PodcastEpisode] = try PodcastEpisode.episodesBasedOn(rssItems: rssItems, withVideos: videoDurations).sorted(by: { lhs, rhs in
        lhs.episodeNo < rhs.episodeNo
      })
      try BrightDigitKit.Podcast.write(from: episodes, atContentPathURL: contentPathURL, options: options)
    }
  }
}
