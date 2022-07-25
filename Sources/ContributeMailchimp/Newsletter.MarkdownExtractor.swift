import Contribute
public extension Newsletter {
  struct MarkdownExtractor: Contribute.MarkdownExtractor {
    public func markdown(from source: Newsletter.Source, using _: @escaping (String) throws -> String) throws -> String {
      source.markdown
    }

    public init() {}
    public typealias SourceType = Source
  }
}
