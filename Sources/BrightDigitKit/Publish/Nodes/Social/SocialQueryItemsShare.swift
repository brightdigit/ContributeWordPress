import Foundation

protocol SocialQueryItemsShare: SocialShare {
  func queryItems<PostableType: Postable>(for item: PostItem<PostableType>) -> [URLQueryItem]
  static var baseURLComponents: URLComponents { get }
}

extension SocialQueryItemsShare {
  func shareURL<PostableType: Postable>(for item: PostItem<PostableType>) -> URL {
    var urlComponents = Self.baseURLComponents
    urlComponents.queryItems = queryItems(for: item)
    return urlComponents.url!
  }
}
