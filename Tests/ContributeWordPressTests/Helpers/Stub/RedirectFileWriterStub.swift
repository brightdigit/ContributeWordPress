import ContributeWordPress
import Foundation

internal struct RedirectFileWriterStub: RedirectFileWriter {
  internal func writeRedirects(
    fromSites _: [SectionName: WordPressSite],
    inDirectory _: URL
  ) throws {
    // doing nothing
  }
}
