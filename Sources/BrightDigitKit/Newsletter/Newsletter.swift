import Foundation

public enum Newsletter: ContentType {
  typealias SourceType = Source
  typealias ContentURLGeneratorType = ContentURLGenerator
  typealias MarkdownExtractorType = MarkdownExtractor
  typealias FrontMatterTranslatorType = FrontMatterTranslator
}
