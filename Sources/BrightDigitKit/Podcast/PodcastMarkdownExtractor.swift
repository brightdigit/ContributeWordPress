public struct PodcastMarkdownExtractor: MarkdownExtractor {
  public typealias SourceType = Episode

  public func markdown(from episode: Episode) throws -> String {
    episode.content
  }
}
