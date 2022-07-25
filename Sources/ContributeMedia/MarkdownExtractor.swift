import Contribute
public extension Podcast {
  struct MarkdownExtractor: Contribute.MarkdownExtractor {
    public typealias SourceType = Source

    public init() {}

    public func markdown(from source: Podcast.Source, using _: @escaping (String) throws -> String) throws -> String {
      source.content
    }
  }
}
