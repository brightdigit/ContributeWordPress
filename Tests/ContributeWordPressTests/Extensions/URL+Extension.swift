// swiftlint:disable line_length
// swiftlint:disable force_unwrapping
import Foundation

extension URL {
  internal static let diagramForGoalsLink: URL = .init(
    string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/"
  )!
}

extension URL {
  internal static func make(string: String) throws -> URL {
    guard let url = URL(string: string) else {
      throw URLError.invalidURLString
    }

    return url
  }
}

extension URL {
  internal static let temporaryResourcesPathURL: URL = .temporaryDirURL.appendingPathComponent("Resources")
}

// TODO: Waiting on Contribute to be updated to use its URL extension instead
extension URL {
  internal static let temporaryDirURL = URL(
    fileURLWithPath: NSTemporaryDirectory(),
    isDirectory: true
  )
}
