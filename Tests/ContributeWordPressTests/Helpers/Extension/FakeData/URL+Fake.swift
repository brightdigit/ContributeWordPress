import Foundation

extension URL {
  // swiftlint:disable:next force_unwrapping line_length
  internal static let diagramForGoalsLink: URL = .init(string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/")!
}

extension URL {
  internal static let temporaryResourcesPathURL: URL =
    .temporaryDirURL.appendingPathComponent("Resources")
}
