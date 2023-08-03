import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that processes WordPress sites and generates Markdowns for their posts.
public struct MarkdownProcessor<
  ContentURLGeneratorType: ContentURLGenerator,
  MarkdownContentBuilderType: MarkdownContentBuilder
> where ContentURLGeneratorType.SourceType == Source,
  MarkdownContentBuilderType.SourceType == Source {
  private let exportDecoder: SitesExportDecoder
  private let assetDownloader: Downloader
  private let redirectWriter: RedirectFileWriter
  private let destinationURLGenerator: ContentURLGeneratorType
  private let contentBuilder: MarkdownContentBuilderType
  private let postFilters: [PostFilter]
  private let assetImportFactory: AssetImportFactory

  /// Initializes a new `MarkdownProcessor` instance.
  ///
  /// - Parameters:
  ///   - exportDecoder: The export decoder.
  ///   - redirectWriter: The redirect file writer.
  ///   - assetDownloader: The asset downloader.
  ///   - destinationURLGenerator: The content URL generator.
  ///   - contentBuilder: The Markdown content builder.
  ///   - postFilters: The post filters.
  ///   - assetImportFactory: The asset import factory.
  public init(
    exportDecoder: SitesExportDecoder,
    redirectWriter: RedirectFileWriter,
    assetDownloader: Downloader,
    destinationURLGenerator: ContentURLGeneratorType,
    contentBuilder: MarkdownContentBuilderType,
    postFilters: [PostFilter],
    assetImportFactory: @escaping AssetImportFactory
  ) {
    self.exportDecoder = exportDecoder
    self.redirectWriter = redirectWriter
    self.assetDownloader = assetDownloader
    self.destinationURLGenerator = destinationURLGenerator
    self.contentBuilder = contentBuilder
    self.postFilters = postFilters
    self.assetImportFactory = assetImportFactory
  }

  private func decodeExports(
    at directoryURL: URL
  ) throws -> [SectionName: WordPressSite] {
    try exportDecoder.sites(fromExportsAt: directoryURL)
  }

  private func writeRedirects(
    fromSites sites: [SectionName: WordPressSite],
    inDirectory directoryURL: URL
  ) throws {
    try redirectWriter.writeRedirects(fromSites: sites, inDirectory: directoryURL)
  }

  private func retrieveAssetImports(
    fromSites sites: [SectionName: WordPressSite],
    using importSettings: ProcessorSettings
  ) throws -> [AssetImport] {
    let assetImports: [AssetImport] = sites.values.flatMap {
      assetImportFactory($0, importSettings)
    }

    try assetDownloader.download(
      assets: assetImports,
      dryRun: importSettings.skipDownload,
      allowsOverwrites: importSettings.overwriteAssets
    )

    return assetImports
  }

  private func writeAllPosts(
    fromSites sites: [SectionName: WordPressSite],
    withAssets assets: [AssetImport],
    inContentDirectory contentDirectoryURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromSitePost: ((WordPressSite) -> ((WordPressPost) -> String))? = nil
  ) throws {
    try sites.forEach { sectionName, site in
      try FileManager.createDirectory(withName: sectionName, in: contentDirectoryURL)
      let htmlFromPost = htmlFromSitePost?(site)
      try site.posts
        .filter(self.postFilters.postSatisfiesAll)
        .map { post in (post, assets.first { $0.parentID == post.ID }) }
        .forEach { post, featuredImage in
          _ = try self.contentBuilder.write(
            from: .init(
              sectionName: sectionName,
              post: post,
              featuredImage: featuredImage.map(\.featuredPath),
              htmlFromPost: htmlFromPost
            ),
            atContentPathURL: contentDirectoryURL,
            basedOn: self.destinationURLGenerator,
            using: htmlToMarkdown
          )
        }
    }
  }

  /// Begins the processing of the WordPress posts.
  ///
  /// - Parameter settings: The required settings for processing WordPress exports.
  /// - Throws: An error if the processing failed at any step.
  public func begin(
    withSettings settings: ProcessorSettings
  ) throws {
    // 1. Decodes WordPress site from exports directory.
    let allSites = try decodeExports(at: settings.exportsDirectoryURL)

    // 2. Writes redirects for all decoded WordPress posts.
    try writeRedirects(fromSites: allSites, inDirectory: settings.resourcesPathURL)

    // 3. Extract and download asset imports for all WordPress sites.
    let assetImports = try retrieveAssetImports(fromSites: allSites, using: settings)

    // 4. Starts writing the markdown files for all WordPress posts for each site.
    try writeAllPosts(
      fromSites: allSites,
      withAssets: assetImports,
      inContentDirectory: settings.contentPathURL,
      using: settings.markdownFrom(html:),
      htmlFromSitePost: settings.htmlFromPost
    )
  }
}

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
    redirectFromatter: RedirectFormatter,
    postFilters: [PostFilter],
    exportDecoder: SitesExportDecoder = SitesExportSynDecoder(),
    assetDownloader: Downloader = AssetDownloader(),
    destinationURLGenerator: ContentURLGeneratorType = .init(),
    contentBuilder: MarkdownContentBuilderType = .init(
      frontMatterExporter: .init(translator: SpecFrontMatterTranslator()),
      markdownExtractor: FilteredHTMLMarkdownExtractor<Source>()
    ),
    assetImportFactory: @escaping AssetImportFactory =
      AssetImport.extractAssetImports(from:using:)
  ) where ContentURLGeneratorType == SectionContentURLGenerator,
    MarkdownContentBuilderType == MarkdownContentYAMLBuilder<
      Source,
      FilteredHTMLMarkdownExtractor<Source>,
      FrontMatterYAMLExporter<Source, SpecFrontMatterTranslator>
    > {
    self.init(
      exportDecoder: exportDecoder,
      redirectWriter: DynamicRedirectFileWriter(redirectFromatter: redirectFromatter),
      assetDownloader: assetDownloader,
      destinationURLGenerator: destinationURLGenerator,
      contentBuilder: contentBuilder,
      postFilters: postFilters,
      assetImportFactory: assetImportFactory
    )
  }
}
