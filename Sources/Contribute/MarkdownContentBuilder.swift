import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol MarkdownContentBuilder {
  associatedtype SourceType
  func content(from source: SourceType, using htmlToMarkdown: @escaping (String) throws -> String) throws -> String
}

public struct MarkdownContentBuilderOptions: OptionSet {
  public let rawValue: Int

  public init(rawValue: RawValue) {
    self.rawValue = rawValue
  }

  public typealias RawValue = Int

  static let shouldOverwriteExisting: Self = .init(rawValue: 1)
  static let includeMissingPrevious: Self = .init(rawValue: 2)
}

public extension MarkdownContentBuilderOptions {
  init(shouldOverwriteExisting: Bool, includeMissingPrevious: Bool) {
    self.init([
      includeMissingPrevious ? .includeMissingPrevious : .init(),
      shouldOverwriteExisting ? .shouldOverwriteExisting : .init()
    ])
  }
}

public extension MarkdownContentBuilder {
  func write<ContentURLGeneratorType: ContentURLGenerator>(
    from source: SourceType,
    atContentPathURL contentPathURL: URL,
    basedOn destinationURLGenerator: ContentURLGeneratorType,
    using htmlToMarkdown: @escaping (String) throws -> String,
    shouldOverwrite: Bool = false
  ) throws -> Bool where ContentURLGeneratorType.SourceType == Self.SourceType {
    let destinationURL = destinationURLGenerator.destinationURL(
      basedOn: source,
      atContentPathURL: contentPathURL
    )
    let fileExists = FileManager.default.fileExists(atPath: destinationURL.path)
    guard !fileExists || shouldOverwrite else {
      return fileExists
    }
    let contentText = try content(from: source, using: htmlToMarkdown)
    try contentText.write(to: destinationURL, atomically: true, encoding: .utf8)
    return fileExists
  }

  func write<ContentURLGeneratorType: ContentURLGenerator>(from sources: [SourceType], atContentPathURL contentPathURL: URL, basedOn urlGenerator: ContentURLGeneratorType, using htmlToMarkdown: @escaping (String) throws -> String, options: MarkdownContentBuilderOptions = []) throws where ContentURLGeneratorType.SourceType == SourceType {
    var newslettersWrittenIndicies = [Int]()
    var lastExistsIndex: Int?
    for (index, source) in sources.enumerated() {
      let fileAlreadyExisted = try write(from: source, atContentPathURL: contentPathURL, basedOn: urlGenerator, using: htmlToMarkdown, shouldOverwrite: options.contains(.shouldOverwriteExisting))
      if fileAlreadyExisted {
        lastExistsIndex = index
      } else {
        newslettersWrittenIndicies.append(index)
      }
    }
    if options.contains(.includeMissingPrevious) {
      return
    }
    if let lastExistsIndex = lastExistsIndex {
      for index in newslettersWrittenIndicies {
        if index < lastExistsIndex {
          let url = urlGenerator.destinationURL(basedOn: sources[index], atContentPathURL: contentPathURL)
          try FileManager.default.removeItem(at: url)
        } else {
          return
        }
      }
    }
  }
}
