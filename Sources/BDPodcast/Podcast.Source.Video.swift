import BDContent
import Foundation

public extension Podcast.Source {
  struct Video: Equatable {
    public let youtubeID: String
    public let duration: TimeInterval
  }
}

public extension Podcast.Source.Video {
  static func dictionaryBasedOn(videos: [YouTubeVideo]) throws -> [String: Self] {
    let videoDurationList = try videos.map { video -> (String, Self) in
      guard let title = video.snippet?.title?.trimmingCharacters(in: .whitespacesAndNewlines) else {
        throw ImportError.missingFieldForVideo(video, .snippetTitle)
      }
      guard let id = video.id else {
        throw ImportError.missingFieldForVideo(video, .id)
      }
      guard let durationString = video.contentDetails?.duration else {
        throw ImportError.missingFieldForVideo(video, .id)
      }
      return (title, Self(youtubeID: id, duration: .init(iso6801: durationString)))
    }
    return try videoDurationList.reduce([String: Self]()) { dictionary, pair in
      let (title, video) = pair
      if let existingVideo = dictionary[title] {
        guard existingVideo == video else {
          throw ImportError.duplicateTitle(title, forVideos: [existingVideo, video])
        }
        return dictionary
      } else {
        var newDictionary = dictionary
        newDictionary[title] = video
        return newDictionary
      }
    }
  }
}
