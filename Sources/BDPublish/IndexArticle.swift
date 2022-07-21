import Foundation
import Publish

public protocol IndexArticle {
  var title: String { get }
  var tags: [Tag] { get }
  var description: String { get }
  var publishedAt: Date { get }
  var lengthInMinutes: Int { get }
  var featuredImageURL: URL { get }
  var rootRelativeURL: URL { get }
}

extension Item: IndexArticle where Site == BrightDigitSite {
  public var publishedAt: Date {
    metadata.date
  }

  public var lengthInMinutes: Int {
    if let mediaDuration = metadata.videoDuration ?? metadata.audioDuration,
       sectionID == .episodes {
      return Int(mediaDuration / 60.0)
    }
    return readingTime.minutes
  }

  public var featuredImageURL: URL {
    URL(staticString: metadata.featuredImage)
  }
}
