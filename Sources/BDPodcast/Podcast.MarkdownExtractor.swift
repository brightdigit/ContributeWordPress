import BDContent
public extension Podcast {
  struct MarkdownExtractor: BDContent.MarkdownExtractor {
    public typealias SourceType = Source

    public init() {}
    public func markdown(from episode: Source) throws -> String {
      episode.content
    }
  }
}
