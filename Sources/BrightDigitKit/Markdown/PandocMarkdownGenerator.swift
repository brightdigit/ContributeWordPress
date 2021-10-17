import Foundation
import ShellOut

public struct PandocMarkdownGenerator: MarkdownGenerator {
  internal init(
    shellOut: @escaping (String, [String]) throws -> String = defaultShellOut,
    temporaryFile: @escaping (String) throws -> URL = Temporary.file(fromContent:)
  ) {
    self.shellOut = shellOut
    self.temporaryFile = temporaryFile
  }

  static func defaultShellOut(to command: String, arguments: [String]) throws -> String {
    try ShellOut.shellOut(to: command, arguments: arguments)
  }

  let shellOut: (String, [String]) throws -> String
  let temporaryFile: (String) throws -> URL
  let pandocPath = "/usr/local/bin/pandoc"

  enum Temporary {
    static let temporaryDirURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)

    static func file(fromContent content: String) throws -> URL {
      let temporaryFileURL = temporaryDirURL.appendingPathComponent(UUID().uuidString)
      try content.write(to: temporaryFileURL, atomically: true, encoding: .utf8)
      return temporaryFileURL
    }
  }

  public func markdown(fromHTML htmlString: String) throws -> String {
    let temporaryFileURL = try temporaryFile(htmlString)
    return try shellOut(pandocPath, ["-f html -t markdown", temporaryFileURL.path])
  }
}
