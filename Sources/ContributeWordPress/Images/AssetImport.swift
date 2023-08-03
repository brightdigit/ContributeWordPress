import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A typealias that represents a factory function for creating asset imports.
public typealias AssetImportFactory =
  (_ site: WordPressSite, _ importSettings: ProcessorSettings) -> [AssetImport]

/// A type that holds information about an asset imported from a `WordPressPost`.
public struct AssetImport: Hashable {
  /// The source `URL` from where asset will be imported.
  public let fromURL: URL

  /// The destination `URL` to where asset will be imported.
  public let atURL: URL

  /// The featured path for the asset.
  public let featuredPath: String

  /// The ID of `WordPressPost` to which the asset belongs.
  public let parentID: Int

  /// Initializes a new `AssetImport` instance.
  ///
  /// - Parameters:
  ///   - importFromURL: The source URL of the asset.
  ///   - importAtURL: The destination URL to where the asset will be imported.
  ///   - featuredPath: The featured path for the asset.
  ///   - parentID: The ID of the `WordPressPost` to which the asset belongs.
  internal init(
    importFromURL: URL,
    importAtURL: URL,
    featuredPath: String,
    parentID: Int
  ) {
    fromURL = importFromURL
    atURL = importAtURL
    self.featuredPath = featuredPath
    self.parentID = parentID
  }

  /// Initializes a new `AssetImport` instance for a `WordPressPost`.
  ///
  /// - Parameters:
  ///   - post: The `WordPressPost` instance.
  ///   - sourceURL: The source URL from where the asset will be imported.
  ///   - assetRoot: The root path for the assets.
  ///   - resourcesPathURL: The URL of the resources path.
  ///   - importPathURL: The URL of the import path.
  public init(
    forPost post: WordPressPost,
    sourceURL: URL,
    assetRoot: String,
    resourcesPathURL: URL,
    importPathURL: URL?
  ) {
    let featuredPath = sourceURL.path
      .replacingOccurrences(
        of: ["", WordPressSite.wpContentUploadsRelativePath].joined(separator: "/"),
        with: assetRoot
      )
      .replacingOccurrences(of: "//", with: "/")

    let destinationURL = resourcesPathURL.appendingPathComponent(featuredPath)

    self.init(
      importFromURL: importPathURL?.appendingPathComponent(sourceURL.path) ?? sourceURL,
      importAtURL: destinationURL,
      featuredPath: featuredPath,
      parentID: post.ID
    )
  }
}

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
    let assetRoot = [
      "",
      importSettings.assetRelativePath,
      site.importDirectoryName
    ].joined(separator: "/")
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
      .flatMap { post in
        regex
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
