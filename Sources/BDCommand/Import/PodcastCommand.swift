import ArgumentParser
import BDContent
import BDPodcast

import Foundation
import Prch
import SwiftTube
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

typealias PodcastEpisode = BDPodcast.Podcast.Source
typealias PodcastEpisodeVideo = BDPodcast.Podcast.Source.Video

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

    static func id(fromRssItem item: RSSItem, andVideo _: BDPodcast.Podcast.Source.Video) -> String? {
      guard item.link.host == "share.transistor.fm" else {
        return nil
      }
      return item.link.lastPathComponent
    }

    static func fileNameWithoutExtensionFromSource(_ source: BDPodcast.Podcast.Source) -> String {
      "\(source.episodeNo.description.padLeft(totalWidth: 3, byString: "0"))-\(source.slug)"
    }

    public func run() throws {
      let youtubeClient = Prch.Client(api: YouTube.API(), session: URLSession.shared)
      let videos = try youtubeClient.videos(fromRequest: .init(apiKey: youtubeAPIKey, playlistID: playlistID))
      let videoDurations = try PodcastEpisodeVideo.dictionaryBasedOn(videos: videos)
      let rssItems = try BDPodcast.Podcast.rssItemsFrom(rss)

      let options: MarkdownContentBuilderOptions = .init(shouldOverwriteExisting: overwriteExisting, includeMissingPrevious: includeMissingPrevious)
      let episodes: [PodcastEpisode] = try PodcastEpisode.episodesBasedOn(rssItems: rssItems, withVideos: videoDurations, id: Self.id).sorted(by: { lhs, rhs in
        lhs.episodeNo < rhs.episodeNo
      })
      try BDPodcast.Podcast.write(from: episodes, atContentPathURL: contentPathURL, fileNameWithoutExtension: Self.fileNameWithoutExtensionFromSource, options: options)
    }
  }
}
