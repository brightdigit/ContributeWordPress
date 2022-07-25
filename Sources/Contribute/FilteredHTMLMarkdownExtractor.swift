import Foundation
public struct FilteredHTMLMarkdownExtractor<SourceType: HTMLSource>: MarkdownExtractor {
  public init() {}

  public func markdown(from source: SourceType, using htmlToMarkdown: @escaping (String) throws -> String) throws -> String {
    let body = try preFilters.reduce(source.html) { try $1($0) }
    let rawMarkdown = try htmlToMarkdown(body)
    return try postFilters.reduce(rawMarkdown) { try $1($0) }
  }

  let preFilters: [(String) throws -> (String)] = []
  let postFilters: [(String) throws -> (String)] = []
}
