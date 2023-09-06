import ContributeWordPress
import Foundation

extension AssetImport {
  internal static func makeAssetImportForAttachmentA() throws -> AssetImport {
    try .make(
      forPost: .attachmentA(),
      sourceURL: URL("http://leogdion.name")
    )
  }
}
