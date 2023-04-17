import ArgumentParser
import BrightDigitSite
import ContributeMedia
import Foundation

public extension BrightDigitSiteCommand {
  struct URLCommand: ParsableCommand {
    public init() {}

    public static var configuration = CommandConfiguration(
      commandName: "url",
      abstract: "Command for previewing urls for the BrightDigit site.",
      subcommands: [Podcast.self]
    )

    struct Podcast: ParsableCommand {
      public init() {}

      @Option(help: "Base URL")
      public var baseURL: URL = BrightDigitSite.SiteInfo.url

      @Option(help: "Base URL Path")
      public var basePath: String = BrightDigitSite.SectionID.episodes.rawValue

      @Option(help: "Episode Number")
      public var episodeNumber: Int

      @Option(help: "Episode Title")
      public var episodeTitle: String

      public func run() throws {
        let fileName = ContributeMedia.Podcast.fileNameWithoutExtensionForEpisode(withNumber: episodeNumber, title: episodeTitle)
        let url = baseURL.appendingPathComponent(basePath).appendingPathComponent(fileName)
        print(url)
      }
    }
  }
}
