import Foundation

public struct YouTubePlaylistRequest {
  public init(apiKey: String, playlistID: String) {
    self.apiKey = apiKey
    self.playlistID = playlistID
  }

  let apiKey: String
  let playlistID: String
}
