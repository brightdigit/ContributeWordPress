import ArgumentParser
import Foundation
import Prch
import SwiftTube
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension BrightDigitSiteCommand.ImportCommand {
  struct Podcast: ParsableCommand {
    public static var configuration = CommandConfiguration(
      commandName: "podcast",
      abstract: "Command for importing a podcast into the BrightDigit site."
    )

    public init() {}

    @Option
    public var playlistID: String

    @Option
    public var youtubeAPIKey: String

    @Option
    public var rss = URL(string: "https://feeds.transistor.fm/empowerapps-show")!

    @Option(help: "Destination directory for markdown files.")
    public var exportMarkdownDirectory: String

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
      let youtubeClient = Prch.APIClient(api: YouTube.API(), session: URLSession.shared)
      let videos = try youtubeClient.videos(fromRequest: .init(apiKey: youtubeAPIKey, playlistID: playlistID))
      let videoDurations = try EpisodeVideo.dictionaryBasedOn(videos: videos)
      let rssItems = try Self.rssItemsFrom(rss)
      let episodes: [Episode] = try Episode.episodesBasedOn(rssItems: rssItems, withVideos: videoDurations)
      let contentBuilder = MarkdownContentYAMLBuilder(
        frontMatterExporter: FrontMatterYAMLExporter(translator: PodcastFrontMatterTranslator()),
        markdownExtractor: PodcastMarkdownExtractor()
      )
      let urlGenerator = PodcastContentURLGenerator()
      for episode in episodes {
        try contentBuilder.write(from: episode, atContentPathURL: contentPathURL, basedOn: urlGenerator)
      }
    }
  }
}
