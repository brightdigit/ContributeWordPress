import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

@available(*, deprecated, renamed: "MarkdownProcessor")
public typealias WordPressMarkdownProcessor = MarkdownProcessor

/// A type that processes WordPress posts and generates Markdown files for each.
public struct MarkdownProcessor<
  ContentURLGeneratorType: ContentURLGenerator,
  MarkdownContentBuilderType: MarkdownContentBuilder
> where ContentURLGeneratorType.SourceType == Source,
  MarkdownContentBuilderType.SourceType == Source {
  private let exportDecoder: PostsExportDecoder
  private let assetDownloader: Downloader
  private let redirectWriter: RedirectFileWriter
  private let destinationURLGenerator: ContentURLGeneratorType
  private let contentBuilder: MarkdownContentBuilderType
  private let postFilters: [PostFilter]
  private let assetImportFactory: AssetImportFactory

  /// Initializes a new `WordPressMarkdownProcessor` instance.
  ///
  /// - Parameters:
  ///   - redirectListGenerator: The redirect list generator.
  ///   - destinationURLGenerator: The content URL generator.
  ///   - contentBuilder: The Markdown content builder.
  ///   - postFilters: The post filters.
  public init(
    exportDecoder: PostsExportDecoder,
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

  /// Writes all posts to the given content path URL.
  ///
  /// - Parameters:
  ///   - allPosts: A dictionary of WordPress posts keyed by section name.
  ///   - assets: An array of assets that were imported from WordPress posts.
  ///   - assetRoot: The root path of the assets directory.
  ///   - contentPathURL: The content path URL.
  ///   - htmlToMarkdown: A function that converts HTML to Markdown.
  /// - Throws: An error if an error occurs.
  private func writeAllPosts(
    _ allPosts: [SectionName: WordPressSite],
    withAssets assets: [AssetImport],
    to contentPathURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromSitePost: ((WordPressSite) -> ((WordPressPost) -> String))? = nil
  ) throws {
    try allPosts.forEach { sectionName, posts in
      try FileManager.createDirectory(withName: sectionName, in: contentPathURL)
      let htmlFromPost = htmlFromSitePost?(posts)
      try posts
        .posts
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
            atContentPathURL: contentPathURL,
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
    // 1. Decodes WordPress posts from exports directory.
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.exportsDirectoryURL)

    // 2. Writes redirects for all decoded WordPress posts.
    try redirectWriter.writeRedirects(
      fromPosts: allPosts,
      inDirectory: settings.resourcesPathURL
    )

    #warning("Should this just use `.filter(self.postFilters.postSatisfiesAll)`?")
    
    
    
    // 4. Build asset imports from all posts
    let assetsImports: [AssetImport] = allPosts.values.flatMap{
      assetImportFactory($0, settings)
    }

    // 5. Download all assets
    try assetDownloader.download(
      assets: assetsImports,
      dryRun: settings.skipDownload,
      allowsOverwrites: settings.overwriteAssets
    )

    // 7. Starts writing the markdown files for all WordPress post,
    try writeAllPosts(
      allPosts,
      withAssets: assetsImports,
      to: settings.contentPathURL,
      using: settings.markdownFrom(html:),
      htmlFromSitePost: settings.htmlFromPost
    )
  }
}

extension MarkdownProcessor {
  /// Initializes a new `WordPressMarkdownProcessor` instance with default values for
  ///   - `PostsExportDecoder`
  ///   - `Downloader`
  ///   - `ContentURLGeneratorType`
  ///   - `MarkdownContentBuilderType`.
  ///
  /// It will be created with a `DynamicRedirectFileWriter` instance that makes use of
  /// `DynamicRedirectGenerator` and the provided `RedirectFormatter` to generate
  /// the redirects and write them into a file.
  ///
  /// - Parameters:
  ///   - redirectFromatter: The formatter to format redirect items into a file.
  ///   - postFilters: The post filters.
  public init(
    redirectFromatter: RedirectFormatter,
    postFilters: [PostFilter],
    exportDecoder: PostsExportDecoder = PostsExportSynDecoder(),
    assetImportFactory: @escaping AssetImportFactory =
      AssetImport.extractAssetImports(from:using:),
    assetDownloader: Downloader = AssetDownloader(),
    destinationURLGenerator: ContentURLGeneratorType = .init(),
    contentBuilder: MarkdownContentBuilderType = .init(
      frontMatterExporter: .init(translator: SpecFrontMatterTranslator()),
      markdownExtractor: FilteredHTMLMarkdownExtractor<Source>()
    )
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
