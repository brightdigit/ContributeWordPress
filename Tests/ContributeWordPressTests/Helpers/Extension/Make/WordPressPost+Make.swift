import Foundation
import SyndiKit

extension WordPressPost {
  // swiftlint:disable:next function_body_length
  internal static func make(
    postID: Int,
    title: String,
    contentEncoded: String?,
    link: URL = .diagramForGoalsLink,
    description: String? = nil,
    guid: EntryID = .diagramForGoalsEntryID,
    type: String = "post",
    postName: String = "post-name",
    pubDate: Date? = Date(),
    postDate: Date? = Date(),
    categories: [RSSItemCategory] = [],
    creators: [String] = ["Leo"],
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
