import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

@available(*, deprecated, message: "Use from Contribute.")
public struct PassthroughMarkdownGenerator: MarkdownGenerator {
  private init() {}
  public static let shared = PassthroughMarkdownGenerator()
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
  public static func beginImport(
    from exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    usingGenerator markdownGenerator: MarkdownGenerator =
      PassthroughMarkdownGenerator.shared,
    filteringPostsWith postFilters: [PostFilter] = .default,
    redirectsFormattedUsing redirectFromatter: RedirectFormatter? = nil,
    importAssetsBy assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false
  ) throws {
    let settings = Settings(
      rootPublishSiteURL: rootPublishSiteURL,
      exportsDirectoryURL: exportsDirectoryURL,
      markdownGenerator: markdownGenerator,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets
    )
    let processor = MarkdownProcessor(
      postFilters: postFilters,
      redirectFromatter: redirectFromatter
    )
    try processor.begin(withSettings: settings)
  }

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
      usingGenerator: PandocMarkdownGenerator(shellOut: shellOut),
      filteringPostsWith: postFilters,
      redirectsFormattedUsing: redirectFromatter,
      importAssetsBy: assetImportSetting,
      overwriteAssets: overwriteAssets
    )
  }
}
