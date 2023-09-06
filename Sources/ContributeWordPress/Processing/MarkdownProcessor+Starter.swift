import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

@available(*, deprecated, message: "Use from Contribute.")
public struct PassthroughMarkdownGenerator: MarkdownGenerator {
  public static let shared = PassthroughMarkdownGenerator()
  private init() {}
  public func markdown(fromHTML htmlString: String) throws -> String {
    htmlString
  }
}

extension MarkdownProcessor where ContentURLGeneratorType == SectionContentURLGenerator,
  MarkdownContentBuilderType == MarkdownContentYAMLBuilder<
    Source,
    FilteredHTMLMarkdownExtractor<Source>,
    FrontMatterYAMLExporter<Source, SpecFrontMatterTranslator>
  > {
  /// Begins the processing of the WordPress posts.
  /// - Parameters:
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - rootPublishSiteURL: Root Directory of the Publish site.
  ///   - markdownGenerator: Converts the given HTML string to Markdown string.
  ///   - postFilters: The post filters.
  ///   - redirectFromatter: Formats the given redirects of old URLs.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  public static func beginImport(
    from exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    filteringPostsWith postFilters: [PostFilter] = .default,
    redirectsFormattedUsing redirectFromatter: RedirectFormatter? = nil,
    importAssetsBy assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    usingGenerator markdownGenerator: MarkdownGenerator =
      PassthroughMarkdownGenerator.shared
  ) throws {
    let settings = Settings(
      rootPublishSiteURL: rootPublishSiteURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      markdownGenerator: markdownGenerator
    )
    let processor = MarkdownProcessor(
      postFilters: postFilters,
      redirectFromatter: redirectFromatter
    )
    try processor.begin(withSettings: settings)
  }

  /// Begins the processing of the WordPress posts.
  /// - Parameters:
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - rootPublishSiteURL: Root Directory of the Publish site.
  ///   - postFilters: The post filters.
  ///   - redirectFromatter: Formats the given redirects of old URLs.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - shellOut: Runs a `pandoc` command
  ///   for converting HTML to Markdown using `ShellOut`
  public static func beginImport(
    from exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    filteringPostsWith postFilters: [PostFilter] = .default,
    redirectsFormattedUsing redirectFromatter: RedirectFormatter? = nil,
    importAssetsBy assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    shellOut: @escaping (String, [String]) throws -> String
  ) throws {
    try beginImport(
      from: exportsDirectoryURL,
      to: rootPublishSiteURL,
      filteringPostsWith: postFilters,
      redirectsFormattedUsing: redirectFromatter,
      importAssetsBy: assetImportSetting,
      overwriteAssets: overwriteAssets,
      usingGenerator: PandocMarkdownGenerator(shellOut: shellOut)
    )
  }
}
