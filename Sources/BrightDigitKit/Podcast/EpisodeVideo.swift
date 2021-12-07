import Foundation

public struct EpisodeVideo: Equatable {
  public let youtubeID: String
  public let duration: TimeInterval
}

extension EpisodeVideo {
  static func dictionaryBasedOn(videos: [YouTubeVideo]) throws -> [String: EpisodeVideo] {
    let videoDurationList = try videos.map { video -> (String, EpisodeVideo) in
      guard let title = video.snippet?.title?.trimmingCharacters(in: .whitespacesAndNewlines) else {
        throw ImportError.missingFieldForVideo(video, .snippetTitle)
      }
      guard let id = video.id else {
        throw ImportError.missingFieldForVideo(video, .id)
      }
      guard let durationString = video.contentDetails?.duration else {
        throw ImportError.missingFieldForVideo(video, .id)
      }
      return (title, EpisodeVideo(youtubeID: id, duration: .init(iso6801: durationString)))
    }
    return try videoDurationList.reduce([String: EpisodeVideo]()) { dictionary, pair in
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
