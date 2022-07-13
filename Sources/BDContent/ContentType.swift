import Foundation

public protocol ContentType {
  associatedtype SourceType
  associatedtype ContentURLGeneratorType: ContentURLGenerator where ContentURLGeneratorType.SourceType == SourceType
  associatedtype MarkdownExtractorType: MarkdownExtractor where MarkdownExtractorType.SourceType == SourceType
  associatedtype FrontMatterTranslatorType: FrontMatterTranslator where FrontMatterTranslatorType.SourceType == SourceType
}

public extension ContentType {
  static func contentBuilder() -> MarkdownContentYAMLBuilder<SourceType, MarkdownExtractorType, FrontMatterYAMLExporter<SourceType, FrontMatterTranslatorType>> {
    MarkdownContentYAMLBuilder(
      frontMatterExporter: FrontMatterYAMLExporter(translator: Self.FrontMatterTranslatorType()),
      markdownExtractor: MarkdownExtractorType()
    )
  }

  static func write(from sources: [SourceType], atContentPathURL contentPathURL: URL, options: MarkdownContentBuilderOptions = []) throws {
    try contentBuilder().write(from: sources, atContentPathURL: contentPathURL, basedOn: ContentURLGeneratorType(), options: options)
  }
}
