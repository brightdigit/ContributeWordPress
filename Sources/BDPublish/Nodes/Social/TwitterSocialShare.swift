import Foundation

struct TwitterSocialShare: SocialQueryItemsShare {
  let flaticonName: String = "twitter"

  static let baseURLComponents = URLComponents(string: "https://twitter.com/intent/tweet")!

  func queryItems<PostableType>(for item: PostItem<PostableType>) -> [URLQueryItem] where PostableType: Postable {
    var queryItems = [URLQueryItem]()
    queryItems.append(URLQueryItem(name: "text", value: item.title))
    queryItems.append(URLQueryItem(name: "url", value: item.absoluteURL.absoluteString))
    queryItems.append(URLQueryItem(name: "via", value: PostableType.twitterSource))
    return queryItems
  }

  let actionText: String = "Share On"
  let nameText: String = "Twitter"
}
