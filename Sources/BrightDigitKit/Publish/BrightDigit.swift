import Foundation
import Plot
import Publish

// This type acts as the configuration for your website.
public struct BrightDigit: Website {
  public enum SectionID: String, WebsiteSectionID {
    // Add the sections that you want your website to contain here:
    case articles
    case episodes
    case videos
    case tutorials
    case newsletters
  }

  public struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
    var featuredImage: String?
  }

  // Update these properties to configure your website:
  public var url = URL(string: "https://brightdigit.com")!
  public var name = "BrightDigit"
  public var description = "A description of BrightdigitCom"
  public var language: Language { .english }
  public var imagePath: Path? { nil }
}
