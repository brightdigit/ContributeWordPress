import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

@available(*, deprecated, renamed: "AssetImport")
public typealias WordPressAssetImport = AssetImport

/// A type that holds information about an asset imported from a `WordPressPost`.
public struct AssetImport: Hashable {
  /// The original URL of the asset.
  /// /// The source `URL` from where asset will be imported.
  public let fromURL: URL

  /// The destination `URL` to where asset will be imported.
  public let atURL: URL

  /// The featured path for the asset.
  public let featuredPath: String

  /// The id of `WordPressPost` to which the asset belongs.
  public let parentID: Int

  /// Initializes a new `WordPressAssetImport` instance.
  ///
  /// - Parameters:
  ///   - importFromURL: The original URL of the asset.
  ///   - parentID: The id of `WordPressPost` to which the asset belongs.
  ///   - newPath: The new path where the asset will be saved.
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

  public init?(
    forPost post: WordPressPost,
    sourceURL: URL,
    assetRoot: String,
    resourcePathURL: URL,
    importPathURL: URL?
  ) {
    let featuredPath = sourceURL.path
      .replacingOccurrences(
        of: "/wp-content/uploads",
        with: assetRoot
      )
      .replacingOccurrences(of: "//", with: "/")

    let destinationURL = resourcePathURL.appendingPathComponent(featuredPath)

    self.init(
      importFromURL: importPathURL?.appendingPathComponent(sourceURL.path) ?? sourceURL,
      importAtURL: destinationURL,
      featuredPath: featuredPath,
      parentID: post.ID
    )
  }
}

extension URL {
  var firstHostComponent : String? {
    return self.host?.components(separatedBy: ".").first
  }
}

extension WordPressSite {
  public var importDirectoryName : String {
    self.baseBlogURL?.firstHostComponent ?? self.link.firstHostComponent ?? self.baseSiteURL?.firstHostComponent ?? "default"
  }
  
  public var baseURL : URL {
    
      self.baseBlogURL ?? self.link 
  }
}

extension AssetImport {
  public static func defaultAssetsImagesRegex(
    forAssetSiteURL assetSiteURL: URL,
    relativeResourcePath: String = "wp-content/uploads"
  ) throws -> NSRegularExpression {
    try NSRegularExpression(pattern: "\(assetSiteURL)/\(relativeResourcePath)([^\"]+)")
  }
  
  public static func extractAssetImports(
    from site: WordPressSite,
    using importSettings: ProcessorSettings
  ) -> [AssetImport] {
    let assetRoot = ["", importSettings.assetRelativePath, site.importDirectoryName].joined(separator: "/")
    let regex = try! Self.defaultAssetsImagesRegex(forAssetSiteURL: site.baseURL)
    return regex
      .matchUrls(in: site.posts)
      .compactMap { match in
        AssetImport(
          forPost: match.post,
          sourceURL: match.sourceURL,
          assetRoot: assetRoot,
          resourcePathURL: importSettings.resourcesPathURL,
          importPathURL: importSettings.importAssetPathURL
        )
      }
  }
}

public typealias AssetImportFactory =
  (WordPressSite, ProcessorSettings) -> [AssetImport]
