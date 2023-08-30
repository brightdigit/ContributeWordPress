import ContributeWordPress
import Foundation

extension AssetImport {
  internal static func makeAssetImportForAttachmentA() throws -> AssetImport {
    try .make(
      forPost: .attachmentA(),
      sourceURL: try .make(string: "http://leogdion.name")
    )
  }
}
