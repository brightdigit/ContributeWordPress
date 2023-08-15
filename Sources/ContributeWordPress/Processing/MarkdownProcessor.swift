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
  internal let exportDecoder: SitesExportDecoder
  internal let assetDownloader: Downloader
  internal let redirectWriter: RedirectFileWriter?
  internal let assetImportFactory: AssetImportFactory
  private let destinationURLGenerator: ContentURLGeneratorType
  private let contentBuilder: MarkdownContentBuilderType
  private let postFilters: [PostFilter]

  /// Initializes a new `MarkdownProcessor` instance.
  ///
  /// - Parameters:
  ///   - exportDecoder: The export decoder.
  ///   - redirectWriter: Optional redirect file writer.
  ///   - assetDownloader: The asset downloader.
  ///   - destinationURLGenerator: The content URL generator.
  ///   - contentBuilder: The Markdown content builder.
  ///   - postFilters: The post filters.
  ///   - assetImportFactory: The asset import factory.
  public init(
    contentBuilder: MarkdownContentBuilderType,
    destinationURLGenerator: ContentURLGeneratorType,
    exportDecoder: SitesExportDecoder = SitesExportSynDecoder(),
    postFilters: [PostFilter] = .default,
    redirectWriter: RedirectFileWriter? = nil,
    assetDownloader: Downloader = AssetDownloader(),
    assetImportFactory: @escaping AssetImportFactory =
      AssetImport.extractAssetImports(from:using:)
  ) {
    self.exportDecoder = exportDecoder
    self.redirectWriter = redirectWriter
    self.assetDownloader = assetDownloader
    self.destinationURLGenerator = destinationURLGenerator
    self.contentBuilder = contentBuilder
    self.postFilters = postFilters
    self.assetImportFactory = assetImportFactory
  }

  internal func writeAllPosts(
    fromSites sites: [SectionName: WordPressSite],
    withAssets assets: [AssetImport],
    withSettings settings: ProcessorSettings
  ) throws {
    try writeAllPosts(
      fromSites: sites,
      withAssets: assets,
      inContentDirectory: settings.contentPathURL,
      using: settings.markdownFrom(html:),
      htmlFromSitePost: settings.htmlFromPost
    )
  }

  private func writeSite(
    _ site: WordPressSite,
    sectionName: String,
    importing assets: [AssetImport],
    to contentDirectoryURL: URL,
    transformFromHTML: @escaping (String) throws -> String,
    transformerFromPost: ((WordPressSite) -> ((WordPressPost) -> String))? = nil
  ) throws {
    try FileManager.createDirectory(withName: sectionName, in: contentDirectoryURL)
    let htmlFromPost = transformerFromPost?(site)
    try site.posts
      .filter(postFilters.postSatisfiesAll)
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
          using: transformFromHTML
        )
      }
  }

  private func writeAllPosts(
    fromSites sites: [SectionName: WordPressSite],
    withAssets assets: [AssetImport],
    inContentDirectory contentDirectoryURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromSitePost: ((WordPressSite) -> ((WordPressPost) -> String))? = nil
  ) throws {
    try sites.forEach { sectionName, site in
      try writeSite(
        site,
        sectionName: sectionName,
        importing: assets,
        to: contentDirectoryURL,
        transformFromHTML: htmlToMarkdown,
        transformerFromPost: htmlFromSitePost
      )
    }
  }
}
