import Foundation

enum MissingFields {
  enum NewsletterField: String, MissingField {
    case issueNo
    case archiveURL

    static let typeName: String = "Newsletter"
    var fieldName: String {
      rawValue
    }
  }

  enum PodcastField: String, MissingField {
    case episodeNo
    case audioDuration
    case transistorID
    static let typeName: String = "PodcastEpisode"
    var fieldName: String {
      rawValue
    }
  }
}
