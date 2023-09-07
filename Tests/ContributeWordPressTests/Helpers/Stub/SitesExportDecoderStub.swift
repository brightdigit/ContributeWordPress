import ContributeWordPress
import Foundation

internal struct SitesExportDecoderStub: SitesExportDecoder {
  internal func sites(fromExportsAt _: URL) throws -> [SectionName: WordPressSite] {
    let site: WordPressSite = try .leogdion()

    return ["blogs": site]
  }
}
