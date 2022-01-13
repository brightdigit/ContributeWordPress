import Foundation

public enum Podcast: ContentType {
  typealias SourceType = Source

  typealias ContentURLGeneratorType = ContentURLGenerator

  typealias MarkdownExtractorType = MarkdownExtractor

  typealias FrontMatterTranslatorType = FrontMatterTranslator
}
