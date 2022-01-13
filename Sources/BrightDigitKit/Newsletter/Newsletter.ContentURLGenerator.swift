import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension Newsletter {
  struct ContentURLGenerator: BrightDigitKit.ContentURLGenerator {
    public func destinationURL(basedOn source: Source, atContentPathURL contentPathURL: URL) -> URL {
      contentPathURL.appendingPathComponent("\(source.issueNo.description.padLeft(totalWidth: 3, byString: "0"))-\(source.slug)").appendingPathExtension("md")
    }

    public init() {}
    public typealias SourceType = Source
  }
}
