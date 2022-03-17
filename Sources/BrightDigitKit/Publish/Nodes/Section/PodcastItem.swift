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
  let transistorID: String
  let source: Item<BrightDigitSite>

  static let youtubeImageBaseURL = URL(staticString: "https://i.ytimg.com/vi/")

  var imageURL: URL {
    guard let youtubeID = youtubeID, episodeNo > 86 else {
      return featuredImageURL
    }
    return Self.youtubeImageBaseURL.appendingPathComponent(youtubeID).appendingPathComponent("maxresdefault.jpg")
  }

  static let baseYoutubeImageURL = URL(string: "https://img.youtube.com/vi/")!
  static let maxresdefault = "maxresdefault.jpg"

  var youtubeImage: URL? {
    guard episodeNo > 86 else {
      return nil
    }
    return youtubeID.map {
      Self.baseYoutubeImageURL.appendingPathComponent($0).appendingPathComponent(Self.maxresdefault)
    }
  }

  var featuredItemContent: Node<HTML.BodyContext> {
    .header(
      .id("episode-\(episodeNo)"),
      .header(
        .img(.src(imageURL)),
        .a(
          .href(source.path),
          .h2(.text(title))
        ),
        .div(
          .class("publish-date"),
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        ),
        .div(
          .class("length"),
          .div(
            .class("audio"),
            .text(PiHTMLFactory.formatTimeInterval(audioDuration))
          ),
          .unwrap(videoDuration) { videoDuration in
            .div(
              .class("video"),
              .text(PiHTMLFactory.formatTimeInterval(videoDuration))
            )
          }
        )

      ),
      .main(
        .text(description)
      ),
      .footer(
        .div(.class("published-date"), .text(PiHTMLFactory.dateFormatter.string(from: publishedDate))),

        .div(.class("audio-length"), .text(
          PiHTMLFactory.formatTimeInterval(audioDuration)
        )),

        .unwrap(videoDuration) { videoDuration in
          .div(.class("video-length"), .text(
            PiHTMLFactory.formatTimeInterval(videoDuration)
          ))
        }
      )
    )
  }

  var sectionItemContent: [Node<HTML.BodyContext>] {
    [
      .id("episode-\(episodeNo)"),
      .header(
        .img(.src(imageURL)),
        .a(
          .href(source.path),
          .h2(.text(title))
        ),
        .div(
          .class("publish-date"),
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        ),
        .div(
          .class("length"),
          .div(
            .class("audio"),
            .text(PiHTMLFactory.formatTimeInterval(audioDuration))
          ),
          .unwrap(videoDuration) { videoDuration in
            .div(
              .class("video"),
              .text(PiHTMLFactory.formatTimeInterval(videoDuration))
            )
          }
        )

      ),
      .main(
        .text(description)
      ),
      .footer(
        .div(.class("published-date"), .text(PiHTMLFactory.dateFormatter.string(from: publishedDate))),

        .div(.class("audio-length"), .text(
          PiHTMLFactory.formatTimeInterval(audioDuration)
        )),

        .unwrap(videoDuration) { videoDuration in
          .div(.class("video-length"), .text(
            PiHTMLFactory.formatTimeInterval(videoDuration)
          ))
        }
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
      .header(
        .h2(.text("Episode #\(episodeNo)")),
        .h1(.text(title)),
        .div(
          .class("publish-date"),
          .text(PiHTMLFactory.itemFormatter.string(from: publishedDate))
        ),
        .div(
          .class("length"),
          .div(
            .class("audio"),
            .text(PiHTMLFactory.formatTimeInterval(audioDuration))
          ),
          .unwrap(videoDuration) { videoDuration in
            .div(
              .class("video"),
              .text(PiHTMLFactory.formatTimeInterval(videoDuration))
            )
          }
        )
      ),
      .main(
        .header(
          .img(.src(featuredImageURL)),
          .div(.class("description"), .text(description)),
          .ol(
            .li(
              .a(
                .href(transistorShareURL),
                .text("podcast")
              )
            ),
            .unwrap(youtubeShareURL) { youtubeShareURL in
              .li(
                .a(
                  .href(youtubeShareURL),
                  .text("youtube")
                )
              )
            }
          )
        ),
        transistorEmbed,
        .unwrap(youtubeEmbed) { $0 },

        .contentBody(source.body)
      )
    ]
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
        .attribute(named: "width", value: "560"),
        .attribute(named: "height", value: "315"),
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
  static let regex = try! NSRegularExpression(pattern: "^\\d+", options: [])

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
