import ArgumentParser
//
import BDPublish
import Publish

public extension BrightDigitSiteCommand {
  struct PublishCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(commandName: "publish")
    public init() {}

    public func run() throws {
      try BrightDigitSite().publish()
    }
  }
}
