import Foundation
import SyndiKit

extension AssetImport {
  /// Extracts asset imports from a ``WordPressSite`` using the specified import settings.
  ///
  /// - Parameters:
  ///   - site: The WordPressSite instance.
  ///   - importSettings: The ProcessorSettings instance.
  /// - Returns: An array of AssetImport instances.
  public static func extractAssetImports(
    from site: WordPressSite,
    using importSettings: ProcessorSettings
  ) -> [AssetImport] {
    let assetRoot = ["", importSettings.assetRelativePath, site.importDirectoryName]
      .joined(separator: "/")
    print(assetRoot)
    return matchUrls(
      in: site.posts,
      using: site.assetURLRegex
    )
    .compactMap { match in
      AssetImport(
        forPost: match.post,
        sourceURL: match.sourceURL,
        assetRoot: assetRoot,
        resourcesPathURL: importSettings.resourcesPathURL,
        importPathURL: importSettings.importAssetPathURL
      )
    }
  }

  private static func matchUrls(
    in posts: [WordPressPost],
    using regex: NSRegularExpression
  ) -> [(sourceURL: URL, post: WordPressPost)] {
    posts
      .map {
        print($0.type)
        return $0
      }
      .flatMap { post in
        return regex
          .matches(
            in: post.body,
            range: NSRange(post.body.startIndex..., in: post.body)
          )
          .compactMap { match in
            guard let range = Range(match.range, in: post.body) else {
              return nil
            }

            guard let url = URL(string: String(post.body[range])) else {
              return nil
            }

            return (sourceURL: url, post: post)
          }
      }
  }
}
