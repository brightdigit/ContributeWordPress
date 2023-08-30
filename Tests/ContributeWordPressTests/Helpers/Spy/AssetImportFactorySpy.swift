import ContributeWordPress
import Foundation

internal final class AssetImportFactorySpy {
  internal private(set) var isCalled: Bool = false

  internal func extractAssetImports(
    from _: WordPressSite,
    using _: ProcessorSettings
  ) -> [AssetImport] {
    isCalled = true

    guard let assertImportA = try? AssetImport.makeAssetImportForAttachmentA() else {
      return []
    }
    return [assertImportA]
  }
}
