import Foundation

protocol SocialShare {
  func shareURL(for item: PostItem) -> URL
  var actionText: String { get }
  var nameText: String { get }
  var flaticonName: String { get }
}
