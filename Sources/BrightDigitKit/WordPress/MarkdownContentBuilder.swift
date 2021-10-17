import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol MarkdownContentBuilder {
  func content(fromPost post: WordPressPost) throws -> String
}

public extension MarkdownContentBuilder {
  func writePost(_ post: WordPressPost, fromFileName fileName: String, atContentPathURL contentPathURL: URL, basedOn destinationURLGenerator: ContentURLGenerator) throws {
    let destinationURL = destinationURLGenerator.destinationURL(basedOnPost: post, fromFileName: fileName, atContentPathURL: contentPathURL)
    let contentText = try content(fromPost: post)
    try contentText.write(to: destinationURL, atomically: true, encoding: .utf8)
  }
}
