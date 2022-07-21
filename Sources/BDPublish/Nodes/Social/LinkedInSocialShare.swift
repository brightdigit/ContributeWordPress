import Foundation

struct LinkedInSocialShare: SocialQueryItemsShare {
  let flaticonName: String = "linkedin"
  static let baseURLComponents = URLComponents(string: "http://www.linkedin.com/shareArticle")!
  func queryItems<PostableType>(for item: PostItem<PostableType>) -> [URLQueryItem] where PostableType: Postable {
    var queryItems = [URLQueryItem]()
    queryItems.append(URLQueryItem(name: "title", value: item.title))
    queryItems.append(URLQueryItem(name: "summary", value: item.description))
    queryItems.append(URLQueryItem(name: "source", value: PostableType.linkedInSource))
    queryItems.append(URLQueryItem(name: "url", value: item.absoluteURL.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)))
    return queryItems
  }

  let actionText: String = "Share On"
  let nameText: String = "LinkedIn"
}
