import BDContent
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
}
