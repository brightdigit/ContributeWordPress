import Foundation

import ArgumentParser

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension BrightDigitSiteCommand.ImportCommand {
  struct WordPress: ParsableCommand, WordPressMarkdownProcessorSettings {
    public static var configuration = CommandConfiguration(
      commandName: "wordpress",
      abstract: "Command for import WordPress export file into the BrightDigit site."
    )

    @Argument(help: "Directory which contains a single or multiple imports.", completion: CompletionKind.directory)
    public var wordpressExportsDirectory: String

    @Option(help: "Base directory for image downloads, redirect files, and other resources.", completion: CompletionKind.directory)
    public var exportResourcesDirectory: String

    @Option(help: "Destination directory for markdown files.")
    public var exportMarkdownDirectory: String

    @Option(help: "Path to Save Images Relative to Resources.")
    public var imageRelativePath = "media/images"

    @Flag(help: "Overwrite Downloaded Images.")
    public var overwriteImages: Bool = false

    @Flag(help: "Skip Downloading Images.")
    public var skipDownload: Bool = false

    public init() {}

    public func run() throws {
      let processor = try WordpressMarkdownProcessor(postFilters: [
        RegexKeyPostFilter(pattern: "post", keyPath: \.type),
        RegexKeyPostFilter(pattern: "^empowerapps-show", keyPath: \.name, not: true),
        RegexKeyPostFilter(pattern: "^$", keyPath: \.name, not: true),
        RegexKeyPostFilter(pattern: "publish", keyPath: \.status)
      ])
      try processor.begin(withSettings: self)
    }
  }
}
