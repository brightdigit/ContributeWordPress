import Foundation

struct EmailSocialShare: SocialQueryItemsShare {
  let flaticonName: String = "newsletter"
  static let baseURLComponents = URLComponents(string: "mailto:")!
  func queryItems(for item: PostItem) -> [URLQueryItem] {
    var queryItems = [URLQueryItem]()
    queryItems.append(URLQueryItem(name: "subject", value: item.title))
    queryItems.append(URLQueryItem(name: "body", value: "\(item.description)\n\n\(item.absoluteURL)"))
    return queryItems
  }

  let actionText: String = "Share With"
  let nameText: String = "Email"
}
