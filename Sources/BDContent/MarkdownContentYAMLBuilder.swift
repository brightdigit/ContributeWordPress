import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct MarkdownContentYAMLBuilder<
  SourceType,
  MarkdownExtractorType: MarkdownExtractor,
  FrontMatterExporterType: FrontMatterExporter
>: MarkdownContentBuilder where FrontMatterExporterType.SourceType == SourceType, MarkdownExtractorType.SourceType == SourceType {
  let frontMatterExporter: FrontMatterExporterType
  let contentFormatter: FrontMatterMarkdownFormatter = SimpleFrontMatterMarkdownFormatter()

  let markdownExtractor: MarkdownExtractorType

  public init(frontMatterExporter: FrontMatterExporterType, markdownExtractor: MarkdownExtractorType) {
    self.frontMatterExporter = frontMatterExporter
    self.markdownExtractor = markdownExtractor
  }

  public func content(from source: SourceType, using htmlToMarkdown: @escaping (String) throws -> String) throws -> String {
    let markdownText = try markdownExtractor.markdown(from: source, using: htmlToMarkdown)
    let frontMatterText = try frontMatterExporter.frontMatterText(from: source)
    return contentFormatter.format(frontMatterText: frontMatterText, withMarkdown: markdownText)
  }
}
