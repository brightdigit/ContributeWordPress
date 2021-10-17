import ArgumentParser
import Foundation
import SyndiKit

extension URL: ExpressibleByArgument {
  public init?(argument: String) {
    self.init(string: argument)
  }
}

public extension BrightDigitSiteCommand.ImportCommand {
  struct YouTube: ParsableCommand {
    public init() {}

    @Option
    public var rss: URL

    @Option
    public var markdown: String

    public func run() throws {
      let decoder = SynDecoder()
      let data = try Data(contentsOf: rss)
      let synfeed = try decoder.decode(data)
    }
  }
}
