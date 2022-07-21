import Foundation

public enum MissingFields {
  public enum NewsletterField: String, MissingField {
    case issueNo
    case archiveURL

    public static let typeName: String = "Newsletter"
    public var fieldName: String {
      rawValue
    }
  }

  public enum PodcastField: String, MissingField {
    case episodeNo
    case audioDuration
    case transistorID
    public static let typeName: String = "PodcastEpisode"
    public var fieldName: String {
      rawValue
    }
  }
}
