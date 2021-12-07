import Foundation

public protocol MarkdownExtractor {
  associatedtype SourceType
  func markdown(from source: SourceType) throws -> String
}
