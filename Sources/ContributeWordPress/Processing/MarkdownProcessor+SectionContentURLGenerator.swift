import Contribute
import Foundation
import SyndiKit
import Yams

extension MarkdownProcessor {
  /// Initializes a new `WordPressMarkdownProcessor` instance.
  ///
  /// It will be created with a `DynamicRedirectFileWriter` instance that makes use of
  /// `DynamicRedirectGenerator` and the provided `RedirectFormatter` to generate
  /// the redirects and write them into a file.
  ///
  /// - Parameters:
  ///   - redirectFormatter: The formatter used to make redirects.
  ///   - postFilters: The post filters.
  ///   - exportDecoder: The decoder used to decode posts .
  ///   - assetDownloader: The asset downloader.
  ///   - destinationURLGenerator: The destination URL generator.
  ///   - contentBuilder: The content builder.
  ///   - assetImportFactory: The asset import factory.
  public init(
    contentBuilder: MarkdownContentBuilderType = .init(
      frontMatterExporter: .init(translator: SpecFrontMatterTranslator()),
      markdownExtractor: FilteredHTMLMarkdownExtractor<Source>()
    ),
    destinationURLGenerator: ContentURLGeneratorType = .init(),
    exportDecoder: SitesExportDecoder = SitesExportSynDecoder(),
    postFilters: [PostFilter] = .default,
    redirectFromatter: RedirectFormatter? = nil,
    assetDownloader: Downloader = AssetDownloader(),
    assetImportFactory: @escaping AssetImportFactory =
      AssetImport.extractAssetImports(from:using:)
  ) where ContentURLGeneratorType == SectionContentURLGenerator,
    MarkdownContentBuilderType == MarkdownContentYAMLBuilder<
      Source,
      FilteredHTMLMarkdownExtractor<Source>,
      FrontMatterYAMLExporter<Source, SpecFrontMatterTranslator>
    > {
    self.init(
      contentBuilder: contentBuilder,
      destinationURLGenerator: destinationURLGenerator,
      exportDecoder: exportDecoder,
      postFilters: postFilters,
      redirectWriter: redirectFromatter.map(
        DynamicRedirectFileWriter.init(redirectFromatter:)
      ),
      assetDownloader: assetDownloader,
      assetImportFactory: assetImportFactory
    )
  }
}
