import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that processes WordPress sites and generates Markdowns for their posts.
extension MarkdownProcessor {
  /// Begins the processing of the WordPress posts.
  ///
  /// - Parameter settings: The required settings for processing WordPress exports.
  /// - Throws: An error if the processing failed at any step.
  public func begin(
    withSettings settings: ProcessorSettings
  ) throws {
    // 1. Decodes WordPress site from exports directory.
    let allSites = try exportDecoder.sites(fromExportsAt: settings.exportsDirectoryURL)

    // 2. Writes redirects for all decoded WordPress posts.
    try redirectWriter.writeRedirects(
      fromSites: allSites,
      inDirectory: settings.resourcesPathURL
    )

    // 3. Extract and download asset imports for all WordPress sites.
    let assetImports: [AssetImport] = allSites.values.flatMap {
      assetImportFactory($0, settings)
    }

    try assetDownloader.download(
      assets: assetImports,
      dryRun: settings.skipDownload,
      allowsOverwrites: settings.overwriteAssets
    )

    // 4. Starts writing the markdown files for all WordPress posts for each site.
    try writeAllPosts(
      fromSites: allSites,
      withAssets: assetImports,
      withSettings: settings
    )
  }
}
