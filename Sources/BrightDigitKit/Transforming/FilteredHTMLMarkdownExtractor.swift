import Foundation

public struct FilteredHTMLMarkdownExtractor<SourceType: HTMLSource>: MarkdownExtractor {
  public func markdown(from source: SourceType) throws -> String {
    let body = try preFilters.reduce(source.html) { try $1($0) }
    let rawMarkdown = try markdownGenerator.markdown(fromHTML: body)
    return try postFilters.reduce(rawMarkdown) { try $1($0) }
  }

  let preFilters: [(String) throws -> (String)] = []
  let postFilters: [(String) throws -> (String)] = []
  let markdownGenerator: MarkdownGenerator // = PandocMarkdownGenerator()
}
