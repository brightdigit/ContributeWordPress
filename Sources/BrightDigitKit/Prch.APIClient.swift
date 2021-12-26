import Foundation
import Prch
import SwiftTube

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

typealias YouTubeVideo = SwiftTube.Video

extension Prch.APIClient {
  func playlistItems(fromRequest request: YouTubePlaylistRequest, withAccumulatingResult initialResult: AccumulatingResult<PlaylistItem>? = nil, _ completed: @escaping (Result<[PlaylistItem], APIClientError>) -> Void) {
    var nextResult = initialResult?.items ?? .init()

    self.request(PlaylistItems.YoutubePlaylistItemsList.Request(fields: "items/snippet/resourceId/videoId,nextPageToken", key: request.apiKey, part: ["snippet"], maxResults: 50, pageToken: initialResult?.nextPageToken, playlistId: request.playlistID)) { result in
      let response: PlaylistItemListResponse
      switch result {
      case let .failure(error): completed(.failure(error)); return
      case let .success(.status200(cResponse)): response = cResponse
      }
      if let items = response.items {
        nextResult += items
      }
      if let nextPageToken = response.nextPageToken {
        self.playlistItems(fromRequest: request, withAccumulatingResult: .init(nextPageToken: nextPageToken, items: nextResult), completed)
      } else {
        completed(.success(nextResult))
      }
    }
  }

  func videos(fromRequest request: YouTubePlaylistRequest, on queue: DispatchQueue = .global(), _ completed: @escaping (Result<[YouTubeVideo], ImportError>) -> Void) {
    playlistItems(fromRequest: request) { result in
      let group = DispatchGroup()

      let playlistItems: [PlaylistItem]
      switch result {
      case let .success(pli): playlistItems = pli
      case let .failure(error): completed(.failure(.apiError(error))); return
      }
      let requests = playlistItems.compactMap { $0.snippet?.resourceId?.videoId }.chunked(by: 50).map { ids in
        Videos.YoutubeVideosList.Request(fields: "items(id,contentDetails/duration,snippet/title)", key: request.apiKey, part: ["contentDetails", "snippet"], id: ids, pageToken: nil)
      }
      var results: [Result<Videos.YoutubeVideosList.Response, APIClientError>?]
      results = .init(repeating: nil, count: requests.count)
      for (index, request) in requests.enumerated() {
        group.enter()

        self.request(request) {
          results[index] = $0
          group.leave()
        }
      }
      group.notify(queue: queue) {
        do {
          let videos = try results.reduce([YouTubeVideo].init()) { partialResult, result in
            guard let response = try result?.get() else {
              throw ImportError.missingResponseFromPlaylistID(request.playlistID, .anyResponse)
            }
            guard let videoListResponse = response.success else {
              throw ImportError.missingResponseFromPlaylistID(request.playlistID, .anyResponse)
            }
            guard let items = videoListResponse.items else {
              throw ImportError.missingResponseFromPlaylistID(request.playlistID, .items)
            }
            return partialResult + items
          }
          completed(.success(videos))
        } catch let error as ImportError {
          completed(.failure(error))
        } catch let error as APIClientError {
          completed(.failure(.apiError(error)))
        } catch {
          completed(.failure(.unknownError(error)))
        }
      }
    }
  }

  func videos(fromRequest request: YouTubePlaylistRequest, on _: DispatchQueue = .main) throws -> [YouTubeVideo] {
    let semaphore = DispatchSemaphore(value: 0)

    var result: Result<[YouTubeVideo], ImportError>!
    videos(fromRequest: request) {
      result = $0
      semaphore.signal()
    }
    semaphore.wait()
    return try result.get()
  }
}
