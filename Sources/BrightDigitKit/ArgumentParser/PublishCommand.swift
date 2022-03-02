import ArgumentParser
import Publish
import ReadingTimePublishPlugin

public extension BrightDigitSiteCommand {
  struct PublishCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(commandName: "publish")
    public init() {}

    public func run() throws {
      try BrightDigitSite().publish(using: [
        .optional(.copyResources()),
        .installPlugin(.splash(withClassPrefix: "")),
        .addMarkdownFiles(),
        .installPlugin(.readingTime()),
        .sortItems(by: \.date, order: .descending),

        .generateHTML(withTheme: .company, indentation: .spaces(2)),
        .generateSiteMap(),

        .webpack,
        .generateRSSFeed(including: [.articles, .tutorials])
      ])
    }
  }
}
