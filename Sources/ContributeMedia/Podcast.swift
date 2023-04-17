import Contribute
import Foundation
import SyndiKit

public enum Podcast: ContentType {
  public typealias SourceType = Source
  public typealias MarkdownExtractorType = MarkdownExtractor
  public typealias FrontMatterTranslatorType = FrontMatterTranslator

  public static func rssItemsFrom(_ rssURL: URL) throws -> [RSSItem] {
    let decoder = SynDecoder()
    let data = try Data(contentsOf: rssURL)
    let synfeed = try decoder.decode(data)
    guard let rssFeed = synfeed as? RSSFeed else {
      throw ImportError.invalidRSS(rssURL)
    }
    return rssFeed.channel.items
  }

  public static func fileNameWithoutExtensionForEpisode(withNumber episodeNo: Int, title: String) -> String {
    fileNameWithoutExtensionForEpisode(withNumber: episodeNo, slug: title.convertedToSlug())
  }

  public static func fileNameWithoutExtensionForEpisode(withNumber episodeNo: Int, slug: String) -> String {
    "\(episodeNo.description.padLeft(totalWidth: 3, byString: "0"))-\(slug)"
  }

  public static func fileNameWithoutExtensionFromSource(_ source: Source) -> String {
    fileNameWithoutExtensionForEpisode(withNumber: source.episodeNo, slug: source.slug)
  }

  public static func write(from sources: [SourceType], atContentPathURL contentPathURL: URL, using htmlToMarkdown: @escaping (String) throws -> String, options _: MarkdownContentBuilderOptions = []) throws {
    try write(from: sources, atContentPathURL: contentPathURL, fileNameWithoutExtension: Self.fileNameWithoutExtensionFromSource(_:), using: htmlToMarkdown)
  }
}
