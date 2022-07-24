import Foundation

public protocol MarkdownExtractor {
  associatedtype SourceType
  init()
  func markdown(from source: SourceType, using htmlToMarkdown: @escaping (String) throws -> String) throws -> String
}
