import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol ContentURLGenerator {
  associatedtype SourceType
  func destinationURL(basedOn source: SourceType, atContentPathURL contentPathURL: URL) -> URL
}

public protocol BasicContentURLGenerator: ContentURLGenerator {
  func fileNameWithoutExtensionFromSource(_ source: SourceType) -> String
}

public extension BasicContentURLGenerator {
  func destinationURL(basedOn source: SourceType, atContentPathURL contentPathURL: URL) -> URL {
    let fileNameWithoutExtension = fileNameWithoutExtensionFromSource(source)

    return contentPathURL.appendingPathComponent(fileNameWithoutExtension).appendingPathExtension("md")
  }
}

struct FileNameGenerator<SourceType>: BasicContentURLGenerator {
  let fileNameWithoutExtensionAction: (SourceType) -> String

  init(_ fileNameWithoutExtensionFromSource: @escaping (SourceType) -> String) {
    fileNameWithoutExtensionAction = fileNameWithoutExtensionFromSource
  }

  func fileNameWithoutExtensionFromSource(_ source: SourceType) -> String {
    fileNameWithoutExtensionAction(source)
  }
}
