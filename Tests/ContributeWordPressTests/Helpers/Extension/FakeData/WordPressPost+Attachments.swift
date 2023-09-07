import SyndiKit

extension WordPressPost {
  internal static func attachmentA(postID: Int = 1) throws -> WordPressPost {
    try .make(
      postID: postID,
      title: "\(#function)",
      contentEncoded: "",
      type: "attachment"
    )
  }

  internal static func attachmentB(postID: Int = 1) throws -> WordPressPost {
    try .make(
      postID: postID,
      title: "\(#function)",
      contentEncoded: "",
      type: "attachment"
    )
  }

  internal static func attachmentC(postID: Int = 1) throws -> WordPressPost {
    try .make(
      postID: postID,
      title: "\(#function)",
      contentEncoded: "",
      type: "attachment"
    )
  }
}
