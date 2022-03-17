import Foundation

struct BufferSocialShare: SocialQueryItemsShare {
  let flaticonName: String = "buffer"
  static let baseURLComponents = URLComponents(string: "https://publish.buffer.com/compose")!
  func queryItems(for item: PostItem) -> [URLQueryItem] {
    var queryItems = [URLQueryItem]()
    queryItems.append(URLQueryItem(name: "text", value: item.title))
    queryItems.append(URLQueryItem(name: "url", value: item.absoluteURL.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)))
    return queryItems
  }

  let actionText: String = "Share With"
  let nameText: String = "Buffer"
}
