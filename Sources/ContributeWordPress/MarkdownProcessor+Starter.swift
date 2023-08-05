import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension MarkdownProcessor where ContentURLGeneratorType == SectionContentURLGenerator,
  MarkdownContentBuilderType == MarkdownContentYAMLBuilder<
    Source,
    FilteredHTMLMarkdownExtractor<Source>,
    FrontMatterYAMLExporter<Source, SpecFrontMatterTranslator>
  > {
  public static func begin(
    importFrom exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    usingGenerator markdownGenerator: MarkdownGenerator,
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

  public static func begin(
    importFrom exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    filteringPostsWith postFilters: [PostFilter] = .default,
    redirectsFormattedUsing redirectFromatter: RedirectFormatter? = nil,
    importAssetsBy assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    shellOut: @escaping (String, [String]) throws -> String
  ) throws {
    try begin(
      importFrom: exportsDirectoryURL,
      to: rootPublishSiteURL,
      usingGenerator: PandocMarkdownGenerator(shellOut: shellOut),
      filteringPostsWith: postFilters,
      redirectsFormattedUsing: redirectFromatter,
      importAssetsBy: assetImportSetting,
      overwriteAssets: overwriteAssets
    )
  }
}
