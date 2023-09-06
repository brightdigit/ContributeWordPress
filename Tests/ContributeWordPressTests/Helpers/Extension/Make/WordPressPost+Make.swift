import Foundation
import SyndiKit

extension WordPressPost {
  internal static func make(
    title: String,
    link: URL = .diagramForGoalsLink,
    description: String? = nil,
    guid: EntryID = .diagramForGoalsEntryID,
    type: String = "post",
    postName: String = "post-name",
    pubDate: Date? = Date(),
    postDate: Date? = Date(),
    contentEncoded: String?,
    categories: [RSSItemCategory] = [.Podcasting, .Productivity],
    creators: [String] = ["Leo"],
    postID: Int,
    status: String = "publish",
    attachmentURL: URL? = nil
  ) throws -> WordPressPost {
    try .init(
      item: .make(
        title: title,
        link: link,
        description: description,
        guid: guid,
        type: type,
        postName: postName,
        pubDate: pubDate,
        contentEncoded: contentEncoded,
        postDate: postDate,
        categories: categories,
        creators: creators,
        postID: postID,
        status: status,
        attachmentURL: attachmentURL
      )
    )
  }
}
