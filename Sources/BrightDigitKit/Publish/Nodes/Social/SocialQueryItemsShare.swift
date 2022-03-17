import Foundation

protocol SocialQueryItemsShare: SocialShare {
  func queryItems(for item: PostItem) -> [URLQueryItem]
  static var baseURLComponents: URLComponents { get }
}

extension SocialQueryItemsShare {
  func shareURL(for item: PostItem) -> URL {
    var urlComponents = Self.baseURLComponents
    urlComponents.queryItems = queryItems(for: item)
    return urlComponents.url!
  }
}
