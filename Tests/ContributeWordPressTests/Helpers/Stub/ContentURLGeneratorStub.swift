import Contribute
import ContributeWordPress
import Foundation

internal struct ContentURLGeneratorStub: ContentURLGenerator {
  internal typealias SourceType = Source

  internal func destinationURL(from _: Source, atContentPathURL _: URL) -> URL {
    .temporaryDirURL
  }
}
