import ContributeWordPress
import Foundation
import SyndiKit

extension AssetImport {
  internal static func make(
    forPost post: WordPressPost,
    sourceURL: URL
  ) throws -> AssetImport {
    .init(
      forPost: post,
      sourceURL: sourceURL,
      assetRoot: PublishDefaults.wpAssetsRelativePath,
      resourcesPathURL: .temporaryDir.appendingPathComponent(
        PublishDefaults.resourcesDirectoryName
      ),
      importPathURL: nil
    )
  }
}
