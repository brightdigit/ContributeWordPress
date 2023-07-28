import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that processes WordPress posts and generates Markdown files for each.
public struct WordPressMarkdownProcessor<
  ContentURLGeneratorType: ContentURLGenerator,
  MarkdownContentBuilderType: MarkdownContentBuilder
> where ContentURLGeneratorType.SourceType == WordPressSource,
  MarkdownContentBuilderType.SourceType == WordPressSource {
  private let exportDecoder: PostsExportDecoder
  private var assetDownloader: Downloader
  private let redirectWriter: RedirectFileWriter
  private let destinationURLGenerator: ContentURLGeneratorType
  private let contentBuilder: MarkdownContentBuilderType
  private let postFilters: [PostFilter]

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
    postFilters: [PostFilter]
  ) {
    self.exportDecoder = exportDecoder
    self.redirectWriter = redirectWriter
    self.assetDownloader = assetDownloader
    self.destinationURLGenerator = destinationURLGenerator
    self.contentBuilder = contentBuilder
    self.postFilters = postFilters
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
    _ allPosts: [SectionName: [WordPressPost]],
    withAssets assets: [WordPressAssetImport],
    to contentPathURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromPost: ((WordPressPost) -> String)? = nil
  ) throws {
    try allPosts.forEach { sectionName, posts in
      try FileManager.createDirectory(withName: sectionName, in: contentPathURL)
      try posts
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          // From the list of images attached to this post,
          // choose the first one as featuredImage
          let featuredImagePath = assets
            .first { $0.parentID == post.ID }
            .map { $0.featuredPath }

          _ = try self.contentBuilder.write(
            from: .init(
              sectionName: sectionName,
              post: post,
              featuredImage: featuredImagePath,
              htmlFromPost: htmlFromPost
            ),
            atContentPathURL: contentPathURL,
            basedOn: self.destinationURLGenerator,
            using: htmlToMarkdown
          )
        }
    }
  }

  // TODO: remove this once finished
  // importAssetURLPath /Users/shendy/Desktop/Projects/Leo/gitlab/leogdion.name/Wordpress/html/
  // oldUrl https://leogdion.name/wp-content/uploads/2018/01/diagram-for-goals-e1535132251116.png

  /// Begins the processing of the WordPress posts.
  ///
  /// - Parameter settings: The required settings for processing WordPress exports.
  /// - Throws: An error if the processing failed at any step.
  public func begin(
    withSettings settings: WordPressMarkdownProcessorSettings
  ) throws {
    // 1. Decodes WordPress posts from exports directory.
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.exportsDirectoryURL)

    // 2. Writes redirects for all decoded WordPress posts.
    try redirectWriter.writeRedirects(
      fromPosts: allPosts,
      inDirectory: settings.resourcesPathURL
    )

    // 3. Calculate assets root path for assets under resources directory.
    // ex: media/wp-assets is the relative path directory built
    //     from /Resources/media/wp-assets and /Resources
    var assetRoot = settings.resourceAssetPathURL.relativePath(
      from: settings.resourcesPathURL
    ) ?? settings.resourcesPathURL.path

    let directoryPrefix = settings.assetSiteURL.host?.components(separatedBy: ".").first ?? "default"
    assetRoot = ["", assetRoot, directoryPrefix].joined(separator: "/")


    // 4. Build asset imports from all posts
    let assetsImports: [WordPressAssetImport] = {
      guard let urlPathRegex = try? NSRegularExpression(
        pattern: "\(settings.assetSiteURL)/wp-content/uploads([^\"]+)"
      ) else {
        return []
      }

      return allPosts
        .flatMap(\.value)
        .filter { $0.type == "post" }
        .map { post in
          post.body
            .matchesUrls(regex: urlPathRegex)
            .compactMap { (match: String) -> WordPressAssetImport? in
              guard let sourceURL = URL(string: match) else { return nil }

              print(assetRoot)

              return WordPressAssetImport(
                forPost: post,
                sourceURL: sourceURL,
                assetRoot: assetRoot,
                resourcePathURL: settings.resourcesPathURL,
                importPathURL: settings.importAssetPathURL
              )
            }
        }
        .flatMap { $0 }
    }()

    let htmlFromPost: (WordPressPost) -> String = { post in
      post.body.replacingOccurrences(
        of: "\(settings.assetSiteURL)/wp-content/uploads",
        with: assetRoot
      )
    }

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
      using: type(of: settings).markdownFrom(html:),
      htmlFromPost: htmlFromPost
    )
  }
}

extension WordPressMarkdownProcessor {
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
    assetDownloader: Downloader = AssetDownloader(),
    destinationURLGenerator: ContentURLGeneratorType = .init(),
    contentBuilder: MarkdownContentBuilderType = .init(
      frontMatterExporter: .init(translator: SpecFrontMatterTranslator()),
      markdownExtractor: FilteredHTMLMarkdownExtractor<WordPressSource>()
    )
  ) where ContentURLGeneratorType == SectionContentURLGenerator,
    MarkdownContentBuilderType == MarkdownContentYAMLBuilder<
      WordPressSource,
      FilteredHTMLMarkdownExtractor<WordPressSource>,
      FrontMatterYAMLExporter<WordPressSource, SpecFrontMatterTranslator>
    > {
    self.init(
      exportDecoder: exportDecoder,
      redirectWriter: DynamicRedirectFileWriter(redirectFromatter: redirectFromatter),
      assetDownloader: assetDownloader,
      destinationURLGenerator: destinationURLGenerator,
      contentBuilder: contentBuilder,
      postFilters: postFilters
    )
  }
}

extension String {
  internal func matchesUrls(regex: NSRegularExpression) -> [String] {
    regex
      .matches(
        in: self,
        range: NSRange(self.startIndex..., in: self)
      )
      .compactMap { match -> String? in
        guard let range = Range(match.range, in: self) else {
          return nil
        }

        return String(self[range])
      }
  }
}
