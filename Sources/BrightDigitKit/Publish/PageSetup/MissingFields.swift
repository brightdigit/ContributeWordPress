import Foundation

enum MissingFields {
  enum NewsletterField: String, MissingField {
    case featuredImageURL
    case issueNo
    case archiveURL

    static let typeName: String = "Newsletter"
    var fieldName: String {
      rawValue
    }
  }

  enum PodcastField: String, MissingField {
    case featuredImageURL
    case episodeNo
    case audioDuration
    static let typeName: String = "PodcastEpisode"
    var fieldName: String {
      rawValue
    }
  }

  enum ArticleField: String, MissingField {
    case featuredImageURL
    static let typeName: String = "Article"
    var fieldName: String {
      rawValue
    }
  }

  enum TutorialField: String, MissingField {
    case featuredImageURL
    static let typeName: String = "Tutorial"
    var fieldName: String {
      rawValue
    }
  }
}
