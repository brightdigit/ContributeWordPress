import Foundation
import Plot
import Publish

// This type acts as the configuration for your website.
public struct BrightDigitSite: Website {
  public enum SectionID: String, WebsiteSectionID {
    // Add the sections that you want your website to contain here:
    case articles
    case episodes
    case tutorials
    case newsletters
  }

  public struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
    var featuredImage: String?
    var date: Date
    var longArchiveURL: String?
    var featured: Bool?
    var issueNo: Int?
    var youtubeID: String?
    var audioDuration: TimeInterval?
    var videoDuration: TimeInterval?
  }

  // Update these properties to configure your website:
  public var url = URL(string: "https://brightdigit.com")!
  public var name = "BrightDigit"
  public var description = "A description of BrightdigitCom"
  public var language: Language { .english }
  public var imagePath: Path? { nil }
}
