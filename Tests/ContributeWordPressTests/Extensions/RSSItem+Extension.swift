// swiftlint:disable function_parameter_count
// swiftlint:disable function_body_length
import ContributeWordPress
import Foundation
import SyndiKit

extension RSSItem {
  internal static func make(
    title: String,
    link: URL,
    description: String?,
    guid: EntryID,
    type: String,
    postName: String,
    pubDate: Date?,
    postDate: Date?,
    categories: [RSSItemCategory],
    creators: [String],
    status: String
  ) -> RSSItem {
    .init(
      title: title,
      link: link,
      description: description,
      guid: guid,
      pubDate: pubDate,
      contentEncoded: .init(),
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
      wpPostID: 10,
      wpPostDate: postDate,
      wpPostDateGMT: .distantFuture,
      wpModifiedDate: .distantFuture,
      wpModifiedDateGMT: nil,
      wpPostName: postName,
      wpPostType: type,
      wpPostMeta: nil,
      wpAttachmentURL: nil,
      mediaContent: nil,
      mediaThumbnail: nil
    )
  }
}
