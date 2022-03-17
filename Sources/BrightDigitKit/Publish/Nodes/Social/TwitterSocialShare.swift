import Foundation

struct TwitterSocialShare: SocialQueryItemsShare {
  let flaticonName: String = "twitter"

  static let baseURLComponents = URLComponents(string: "https://twitter.com/intent/tweet")!
  func queryItems(for item: PostItem) -> [URLQueryItem] {
    var queryItems = [URLQueryItem]()
    queryItems.append(URLQueryItem(name: "text", value: item.title))
    queryItems.append(URLQueryItem(name: "url", value: item.absoluteURL.absoluteString))
    queryItems.append(URLQueryItem(name: "via", value: item.source.sectionID == .tutorials ? "leogdion" : "brightdigit"))
    return queryItems
  }

  let actionText: String = "Share On"
  let nameText: String = "Twitter"
}
