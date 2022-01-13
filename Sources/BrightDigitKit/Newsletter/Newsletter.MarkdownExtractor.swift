public extension Newsletter {
  struct MarkdownExtractor: BrightDigitKit.MarkdownExtractor {
    public func markdown(from source: Source) throws -> String {
      source.markdown
    }

    public init() {}
    public typealias SourceType = Source
  }
}
