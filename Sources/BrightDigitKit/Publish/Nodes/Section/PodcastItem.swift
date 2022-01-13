import Foundation
import Plot
import Publish
struct PodcastItem: SectionItem {
  let description: String
  let episodeNo: Int
  let title: String
  let publishedDate: Date
  let youtubeID: String?
  let audioDuration: TimeInterval
  let videoDuration: TimeInterval?
  let featuredImageURL: URL
  let isFeatured: Bool

  var featuredItemContent: [Node<HTML.BodyContext>] {
    [
      .header(
        .img(.src(featuredImageURL)),
        .a(
          .h2(.text(title))
        )
      ),
      .main(
        .text(description)
      )
    ]
  }

  var itemContent: [Node<HTML.BodyContext>] {
    [
      .id("episode-\(episodeNo)"),
      .header(
        .img(.src(featuredImageURL)),
        .a(
          .h2(.text(title))
        )
      ),
      .main(
        .text(description)
      ),
      .footer(
        .a(
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        )
      )
    ]
  }

  // swiftlint:disable:next force_try
  static let regex = try! NSRegularExpression(pattern: "^\\d+", options: [])

  init(item: Item<BrightDigitSite>) throws {
    let featuredImageURL = item.metadata.featuredImage.flatMap(URL.init(string:))
    let archiveURL = item.metadata.longArchiveURL.flatMap(URL.init(string:))
    let isFeatured = item.metadata.featured ?? false

    let episodeNo = item.path.absoluteString.components(separatedBy: "/").last?.components(separatedBy: .decimalDigits.inverted).first.flatMap(Int.init)

    guard let featuredImageURL = featuredImageURL else {
      throw PiError.missingField(MissingFields.PodcastField.featuredImageURL, item)
    }

    guard let episodeNo = episodeNo else {
      throw PiError.missingField(MissingFields.PodcastField.episodeNo, item)
    }

    guard let audioDuration = item.metadata.audioDuration else {
      throw PiError.missingField(MissingFields.PodcastField.audioDuration, item)
    }

    title = item.title
    description = item.description
    self.featuredImageURL = featuredImageURL
    publishedDate = item.metadata.date
    self.episodeNo = episodeNo
    self.audioDuration = audioDuration
    videoDuration = item.metadata.videoDuration
    youtubeID = item.metadata.youtubeID
    self.isFeatured = isFeatured
  }
}
