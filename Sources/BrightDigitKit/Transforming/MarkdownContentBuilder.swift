import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol MarkdownContentBuilder {
  associatedtype SourceType
  func content(from source: SourceType) throws -> String
}

public extension MarkdownContentBuilder {
  func write<ContentURLGeneratorType: ContentURLGenerator>(
    from source: SourceType,
    atContentPathURL contentPathURL: URL,
    basedOn destinationURLGenerator: ContentURLGeneratorType
  ) throws where ContentURLGeneratorType.SourceType == Self.SourceType {
    let destinationURL = destinationURLGenerator.destinationURL(
      basedOn: source,
      atContentPathURL: contentPathURL
    )
    let contentText = try content(from: source)
    try contentText.write(to: destinationURL, atomically: true, encoding: .utf8)
  }
}
