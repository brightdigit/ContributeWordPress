import Contribute
import ContributeWordPress
import Foundation

internal struct ContentURLGeneratorStub: ContentURLGenerator {
  internal typealias SourceType = Source

  internal func destinationURL(
    from source: Source,
    atContentPathURL contentPathURL: URL
  ) -> URL {
    contentPathURL
      .appendingPathComponent(source.sectionName)
      .appendingPathComponent(source.post.name + ".md")
  }
}
