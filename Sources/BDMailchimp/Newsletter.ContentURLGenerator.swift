import BDContent
import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension Newsletter {
  @available(*, deprecated)
  struct ContentURLGenerator: BDContent.ContentURLGenerator {
    public func destinationURL(basedOn source: Source, atContentPathURL contentPathURL: URL) -> URL {
      let fileNameWithoutExtension = "\(source.issueNo.description.padLeft(totalWidth: 3, byString: "0"))-\(source.slug)"

      return contentPathURL.appendingPathComponent(fileNameWithoutExtension).appendingPathExtension("md")
    }

    public init() {}
    public typealias SourceType = Source
  }
}
