import Foundation
import Prch
import SyndiKit

import struct SwiftTube.Video

public enum ImportError: Error {
  public enum ResponseComponent {
    case anyResponse
    case success
    case items
  }

  public enum VideoField {
    case snippetTitle
    case id
    case duration
  }

  public enum EpisodeField {
    case duration
    case title
    case episode
    case summary
    case imageHref
  }

  case directory(URL)
  case imageDownloads([URL: Error])
  case invalidPodcastEpisodeFromRSSItem(RSSItem)
  case invalidRSS(URL)
  case apiError(APIClientError)
  case missingResponseFromPlaylistID(String, ResponseComponent)
  case unknownError(Error)
  case missingFieldForVideo(SwiftTube.Video, VideoField)
  case missingVideoForEpisode(RSSItem)
  case missingFieldFromPodcastEpisode(PodcastEpisode, EpisodeField)
  case duplicateTitle(String, forVideos: [EpisodeVideo])
}
