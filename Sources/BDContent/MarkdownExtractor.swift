import Foundation

public protocol MarkdownExtractor {
  associatedtype SourceType
  init()
  func markdown(from source: SourceType) throws -> String
}
