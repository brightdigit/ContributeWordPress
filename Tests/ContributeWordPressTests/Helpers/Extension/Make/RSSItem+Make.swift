import ContributeWordPress
import Foundation
import SyndiKit

extension RSSItem {
  // swiftlint:disable:next function_body_length function_parameter_count
  internal static func make(
    title: String,
    link: URL,
    description: String?,
    guid: EntryID,
    type: String,
    postName: String,
    pubDate: Date?,
    contentEncoded: String?,
    postDate: Date?,
    categories: [RSSItemCategory],
    creators: [String],
    postID: Int,
    status: String,
    attachmentURL: URL?
  ) -> RSSItem {
    .init(
      title: title,
      link: link,
      description: description,
      guid: guid,
      pubDate: pubDate,
      contentEncoded: contentEncoded,
      categoryTerms: categories,
      content: .init(),
      itunesTitle: "itunes Title",
      itunesEpisode: .init(10),
      itunesAuthor: "itunesAuthor",
      itunesSubtitle: "itunesSubtitle",
      itunesSummary: "itunesSummary",
      itunesExplicit: "itunesExplicit",
      itunesDuration: 10,
      itunesImage: nil,
      enclosure: nil,
      creators: creators,
      wpCommentStatus: .init(),
      wpPingStatus: .init(),
      wpStatus: status,
      wpPostParent: .bitWidth,
      wpMenuOrder: .bitWidth,
      wpIsSticky: .bitWidth,
      wpPostPassword: .init(),
      wpPostID: postID,
      wpPostDate: postDate,
      wpPostDateGMT: .distantFuture,
      wpModifiedDate: .distantFuture,
      wpModifiedDateGMT: nil,
      wpPostName: postName,
      wpPostType: type,
      wpPostMeta: nil,
      wpAttachmentURL: attachmentURL,
      mediaContent: nil,
      mediaThumbnail: nil
    )
  }
}
