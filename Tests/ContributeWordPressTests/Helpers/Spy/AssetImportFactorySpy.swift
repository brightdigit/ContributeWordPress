import Foundation
import ContributeWordPress

internal final class AssetImportFactorySpy {
  internal private(set) var isCalled: Bool = false

  internal func extractAssetImports(
    from site: WordPressSite,
    using importSettings: ProcessorSettings
  ) -> [AssetImport] {
    isCalled = true

    guard let assertImportA = try? AssetImport.makeAssetImportForAttachmentA() else {
      return []
    }
    return [assertImportA]
  }
}
