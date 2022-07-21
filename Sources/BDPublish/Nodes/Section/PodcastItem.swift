import BDSite
import Foundation
import Plot
import Publish

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

struct PodcastItem: SectionItem {
  typealias WebsiteType = BrightDigitSite
  var redirectURL: URL? {
    nil
  }

  static let sectionH1: String? = sectionTitle

  static let sectionTitle: String = "EmpowerApps Podcast"

  static let sectionDescription: String = "Watch and Listen to the latest episodes of EmpowerApps Show, we talk all things app development and Apple"

  let description: String
  let episodeNo: Int
  let title: String
  let publishedDate: Date
  let youtubeID: String?
  let audioDuration: TimeInterval
  let videoDuration: TimeInterval?
  let featuredImageURL: URL
  let isFeatured: Bool
  let transistorID: String
  let source: Item<BrightDigitSite>

  static let youtubeImageBaseURL = URL(staticString: "https://i.ytimg.com/vi/")

  var imageURL: URL {
    guard let youtubeID = youtubeID, episodeNo > 86 else {
      return featuredImageURL
    }
    return Self.youtubeImageBaseURL.appendingPathComponent(youtubeID).appendingPathComponent(Self.maxresdefault)
  }

  static let maxresdefault = "maxresdefault.jpg"

  var featuredItemContent: Node<HTML.BodyContext> {
    .header(
      .section(
        .class("hero"),
        .section(
          .class("featured"),
          .id("episode-\(episodeNo)"),
          .header(
            .div(
              .class("episode-no"),
              .text("episode \(episodeNo)")
            ),
            .a(
              .href(source.path),
              .img(.src(imageURL)),
              .h2(.text(title))
            ),
            .div(
              .class("publish-date"),
              .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
            )
          ),
          .main(
            .a(
              .href(source.path),
              .img(.src(imageURL))
            ),
            .main(
              .div(
                .class("publish-date"),
                .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
              ),
              .p("\(description)"),
              .iframe(
                .attribute(named: "width", value: "100%"),
                .attribute(named: "height", value: "180"),
                .attribute(named: "frameborder", value: "no"),
                .attribute(named: "scrolling", value: "no"),
                .attribute(named: "seamless src", value: "\(transistorEmbedURL)")
              )
            )
          ),
          .footer(
            .iframe(
              .attribute(named: "width", value: "100%"),
              .attribute(named: "height", value: "180"),
              .attribute(named: "frameborder", value: "no"),
              .attribute(named: "scrolling", value: "no"),
              .attribute(named: "seamless src", value: "\(transistorEmbedURL)")
            ),
            .main(
              .div(
                .class("audio-length"),
                .i(.class("flaticon-podcast")),
                .text(PiHTMLFactory.formatTimeInterval(audioDuration))
              ),
              .unwrap(videoDuration) { videoDuration in
                .div(
                  .class("video-length"),
                  .i(.class("flaticon-youtube")),
                  .text(PiHTMLFactory.formatTimeInterval(videoDuration))
                )
              },
              .div(
                .a(
                  .href(source.path),
                  .text("More Info")
                )
              )
            )
          )
        )
      )
    )
  }

  var sectionItemContent: [Node<HTML.BodyContext>] {
    [
      .id("episode-\(episodeNo)"),
      .header(
        .a(
          .href(source.path),
          .img(.src(imageURL)),
          .h2(.text(title))
        ),
        .div(
          .class("publish-date"),
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        )
      ),
      .main(.text(description)),
      .footer(
        .div(
          .class("audio-length"),
          .i(.class("flaticon-podcast")),
          .text(PiHTMLFactory.formatTimeInterval(audioDuration))
        ),
        .div(
          .class("video-length"),
          .i(.class("flaticon-youtube")),
          .unwrap(videoDuration) { videoDuration in
            .text(PiHTMLFactory.formatTimeInterval(videoDuration))
          }
        ),
        .div(
          .a(
            .href(source.path),
            .text(" More Info ")
          )
        )
      )
    ]
  }

  var pageTitle: String {
    title
  }

  var pageBodyID: String? {
    nil
  }

  var pageMainContent: [Node<HTML.BodyContext>] {
    [
      podcastHeader,
      .main(
        descriptionHeader,
        mainContent
      )
    ]
  }

  var podcastHeader: Node<HTML.BodyContext> {
    .header(
      .ol(
        .li(
          .class("episode-no"),
          .i(.class("flaticon-announcement")),
          .text("Episode #\(episodeNo)")
        ),
        .li(
          .class("publish-date"),
          .i(.class("flaticon-calendar")),
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        ),
        .li(
          .class("audio-length"),
          .i(.class("flaticon-podcast")),
          .text(PiHTMLFactory.formatTimeInterval(audioDuration))
        ),
        .li(
          .class("video-length"),
          .i(.class("flaticon-youtube")),
          .unwrap(videoDuration) { videoDuration in
            .text(PiHTMLFactory.formatTimeInterval(videoDuration))
          }
        )
      ),
      .h1("\(title)"),
      .img(
        .class("default"),
        .src(imageURL)
      )
    )
  }

  var descriptionHeader: Node<HTML.BodyContext> {
    .header(
      .img(
        .class("youtube"),
        .src(imageURL)
      ),
      .h1("\(title)"),
      .main(
        .img(
          .class("album"),
          .src(featuredImageURL)
        ),
        .div(
          .class("description"),
          .text(description)
        )
      ),
      .ol(
        .class("media"),
        .li(
          .a(
            .href(transistorShareURL),
            .i(
              .class("flaticon-podcast"),
              .text(PiHTMLFactory.formatTimeInterval(audioDuration))
            ),
            .span(
              .class("specs"),
              .text(" podcast "),
              .span(
                .class("source"),
                .text("at transistor.fm")
              )
            )
          )
        ),
        .li(
          .a(
            .unwrap(youtubeShareURL) { youtubeShareURL in
              .href(youtubeShareURL)
            },
            .i(.class("flaticon-youtube")),
            .unwrap(videoDuration) { videoDuration in
              .text(PiHTMLFactory.formatTimeInterval(videoDuration))
            },
            .span(
              .class("specs"),
              .text(" video "),
              .span(
                .class("source"),
                .text("at youtube.com")
              )
            )
          )
        )
      )
    )
  }

  var mainContent: Node<HTML.BodyContext> {
    .main(
      .div(
        .class("content"),
        transistorEmbed,
        .unwrap(youtubeEmbed) { $0 }
      ),
      showNotes
    )
  }

  var showNotes: Node<HTML.BodyContext> {
    .main(
      .class("show-notes"),
      .contentBody(source.body)
    )
  }

  static let transistorShareBaseURL: URL = Self.transistorBaseURL.appendingPathComponent("s")
  static let transistorEmbedBaseURL: URL = Self.transistorBaseURL.appendingPathComponent("e")
  static let transistorBaseURL: URL = .init(staticString: "https://share.transistor.fm/")

  static let youtubeBaseURL: URL = .init(staticString: "https://www.youtube.com/")
  static let youtubeEmbedBaseURL = Self.youtubeBaseURL.appendingPathComponent("embed")
  static let youtubeShareBaseURLComponents = URLComponents(url: Self.youtubeBaseURL.appendingPathComponent("watch"), resolvingAgainstBaseURL: false)!

  var transistorEmbedURL: URL {
    Self.transistorEmbedBaseURL.appendingPathComponent(transistorID)
  }

  var youtubeEmbedURL: URL? {
    youtubeID.map(Self.youtubeEmbedBaseURL.appendingPathComponent)
  }

  var transistorShareURL: URL {
    Self.transistorShareBaseURL.appendingPathComponent(transistorID)
  }

  var youtubeShareURL: URL? {
    guard let youtubeID = youtubeID else {
      return nil
    }

    var urlComponents = Self.youtubeShareBaseURLComponents
    urlComponents.queryItems = [URLQueryItem(name: "v", value: youtubeID)]
    return urlComponents.url
  }

  var youtubeEmbed: Node<HTML.BodyContext>? {
    youtubeEmbedURL.map { youtubeEmbedURL in
      .iframe(
        .src(youtubeEmbedURL),
        .frameborder(false),
        .allowfullscreen(true),
        .allow("accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture")
      )
    }
  }

  var transistorEmbed: Node<HTML.BodyContext> {
    .iframe(
      .attribute(named: "width", value: "100%"),
      .attribute(named: "height", value: "180"),
      .frameborder(false),
      .attribute(named: "scrolling", value: "no"),
      .attribute(named: "seamless", value: nil),
      .src(transistorEmbedURL)
    )
  }

  // swiftlint:disable:next force_try
  // static let regex = try! NSRegularExpression(pattern: "^\\d+", options: [])

  init(item: Item<BrightDigitSite>, site _: BrightDigitSite) throws {
    source = item
    let featuredImageURL = item.featuredImageURL
    let isFeatured = item.metadata.featured ?? false

    let episodeNo = item.path.absoluteString.components(separatedBy: "/").last?.components(separatedBy: .decimalDigits.inverted).first.flatMap(Int.init)

    guard let episodeNo = episodeNo else {
      throw PiError.missingField(MissingFields.PodcastField.episodeNo, item)
    }

    guard let audioDuration = item.metadata.audioDuration else {
      throw PiError.missingField(MissingFields.PodcastField.audioDuration, item)
    }

    guard let transistorID = item.metadata.transistorID else {
      throw PiError.missingField(MissingFields.PodcastField.transistorID, item)
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
    self.transistorID = transistorID
  }
}
