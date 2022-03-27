import Foundation

protocol SocialShare {
  func shareURL<PostableType: Postable>(for item: PostItem<PostableType>) -> URL
  var actionText: String { get }
  var nameText: String { get }
  var flaticonName: String { get }
}

enum SocialShares {
  static let shares: [SocialShare] = [
    TwitterSocialShare(),
    LinkedInSocialShare(),
    BufferSocialShare(),
    EmailSocialShare()
  ]
}
