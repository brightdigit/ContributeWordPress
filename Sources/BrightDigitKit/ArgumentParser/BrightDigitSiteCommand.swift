import ArgumentParser

public struct BrightDigitSiteCommand: ParsableCommand {
  public init() {}

  public static var configuration = CommandConfiguration(
    abstract: "Command for maintaining the BrightDigit site.",
    subcommands: [PublishCommand.self, ImportCommand.self],
    defaultSubcommand: PublishCommand.self
  )
}
