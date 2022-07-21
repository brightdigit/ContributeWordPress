import BDSite
import Foundation
import NodeJSPublishPlugin
import Plot
import Publish
import ReadingTimePublishPlugin
import SplashPublishPlugin
import TransistorPublishPlugin
import YoutubePublishPlugin

// This type acts as the configuration for your website.
public struct BrightDigitSite: Website, MetadataAttached {
  public init(imagePath: Path? = SiteInfo.imagePath) {
    self.imagePath = imagePath
  }

  public enum SectionID: String, WebsiteSectionID {
    // Add the sections that you want your website to contain here:
    case articles
    case episodes
    case tutorials
    case newsletters
  }

  // periphery:ignore
  public struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
    var featuredImage: String
    var date: Date
    var longArchiveURL: String?
    var featured: Bool?
    var issueNo: Int?
    var youtubeID: String?
    var audioDuration: TimeInterval?
    var videoDuration: TimeInterval?
    var transistorID: String?
    var subscriptionCTA: String?
  }

  public static var metadata: WebsiteMetadata {
    WebsiteMetadata(title: Self.SiteInfo.title)
  }

  public enum SiteInfo {
    public static let url = URL(staticString: "https://brightdigit.com")
    public static let name = "BrightDigit"
    public static let title = "BrightDigit | Expert Swift App Development"
    public static let description = "Need a specialist Swift developer for your business’s next app to grow sales and delight customers? We are your go-to for expert development in the Apple ecosystem. Learn more..."
    public static let imagePath: Path = "/android-chrome-512x512.png"
  }

  // Update these properties to configure your website:
  public let url = SiteInfo.url
  public let name = SiteInfo.name
  public let description = SiteInfo.description
  public var language: Language { .english }
  public var imagePath: Path? = SiteInfo.imagePath

  static let defaultSteps: [PublishingStep<BrightDigitSite>] = [
    .optional(.copyResources()),
    .installPlugin(.transistor()),
    .installPlugin(.youtube()),
    .installPlugin(.splash(withClassPrefix: "")),
    .addMarkdownFiles(),
    .yamlStringFix,
    .installPlugin(.readingTime()),
    .sortItems(by: \.date, order: .descending),

    .generateHTML(withTheme: .company, indentation: .spaces(2)),
    .generateRSSFeed(including: [.articles, .tutorials]),
    .generateRSSFeed(including: [.articles], config: .init(targetPath: "articles.rss")),

    .generateRSSFeed(including: [.tutorials], config: .init(targetPath: "tutorials.rss")),
    .generateSiteMap(excluding: .init(["newsletters/"])),

    .webpack
  ]
}

public extension BrightDigitSite {
  func publish() throws {
    try publish(using: Self.defaultSteps)
  }
}
