import Foundation
import ContributeWordPress

internal struct AssetImportFactoryStub {
  internal func extractAssetImports(
    from site: WordPressSite,
    using importSettings: ProcessorSettings
  ) -> [AssetImport] {
    return []
  }
}
