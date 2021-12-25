import ArgumentParser
import Foundation
import MarkdownGenerator
import Publish
import ShellOut
import SyndiKit
import Yams

public extension BrightDigitSiteCommand {
  struct ImportCommand: ParsableCommand {
    public init() {}
    public static var configuration = CommandConfiguration(
      commandName: "import",
      abstract: "Command for import into the BrightDigit site.",
      subcommands: [WordPress.self, Podcast.self, Mailchimp.self]
    )
  }
}
