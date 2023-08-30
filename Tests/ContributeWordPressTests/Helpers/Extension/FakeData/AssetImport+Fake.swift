import Foundation
import ContributeWordPress

extension AssetImport {
  internal static func makeAssetImportForAttachmentA() throws -> AssetImport {
    try .make(
      forPost: .attachmentA(), 
      sourceURL: try .make(string: "http://leogdion.name")
    )
  }
}
