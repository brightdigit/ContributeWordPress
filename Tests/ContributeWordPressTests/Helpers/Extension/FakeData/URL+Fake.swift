// swiftlint:disable line_length
// swiftlint:disable force_unwrapping
import Foundation

extension URL {
  internal static let diagramForGoalsLink: URL = .init(
    string: "https://leogdion.name/2018/01/08/from-goals-to-actions-2018/diagram-for-goals/"
  )!
}

extension URL {
  internal static let temporaryResourcesPathURL: URL =
    .temporaryDirURL.appendingPathComponent("Resources")
}
