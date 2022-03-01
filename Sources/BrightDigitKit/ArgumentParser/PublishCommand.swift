import ArgumentParser
import Publish

public extension BrightDigitSiteCommand {
  struct PublishCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(commandName: "publish")
    public init() {}

    public func run() throws {
      try BrightDigitSite().publish(using: [
        .optional(.copyResources()),
        .installPlugin(.splash(withClassPrefix: "")),
        .addMarkdownFiles(),
        .sortItems(by: \.date, order: .descending),

        .generateHTML(withTheme: .company, indentation: .spaces(2)),
        .generateSiteMap(),

        .webpack,
        .generateRSSFeed(including: [.articles, .tutorials])
      ])
    }
  }
}
