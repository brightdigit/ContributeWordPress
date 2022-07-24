import Foundation

public protocol ContentType {
  associatedtype SourceType
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

  static func write<ContentURLGeneratorType: ContentURLGenerator>(from sources: [SourceType], atContentPathURL contentPathURL: URL, using htmlToMarkdown: @escaping (String) throws -> String, options: MarkdownContentBuilderOptions = [], using generator: ContentURLGeneratorType) throws where ContentURLGeneratorType.SourceType == Self.SourceType {
    try contentBuilder().write(from: sources, atContentPathURL: contentPathURL, basedOn: generator, using: htmlToMarkdown, options: options)
  }

  static func write(from sources: [SourceType], atContentPathURL contentPathURL: URL, fileNameWithoutExtension: @escaping (SourceType) -> String, using htmlToMarkdown: @escaping (String) throws -> String, options: MarkdownContentBuilderOptions = []) throws {
    let contentURLGenerator = FileNameGenerator(fileNameWithoutExtension)
    try write(from: sources, atContentPathURL: contentPathURL, using: htmlToMarkdown, options: options, using: contentURLGenerator)
  }
}
