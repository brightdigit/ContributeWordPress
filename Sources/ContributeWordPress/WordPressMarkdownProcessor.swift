// swiftlint:disable file_length
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
  /// The redirect formatter used by the processor.
  private let redirectFromatter: RedirectFormatter = NetlifyRedirectFormatter()
  private var downloader: Downloader = AssetDownloader()
  private let exportDecoder: PostsExportDecoder = PostsExportSynDecoder()

  private let redirectListGenerator: RedirectListGenerator
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
    redirectListGenerator: RedirectListGenerator,
    destinationURLGenerator: ContentURLGeneratorType,
    contentBuilder: MarkdownContentBuilderType,
    postFilters: [PostFilter]
  ) {
    self.redirectListGenerator = redirectListGenerator
    self.destinationURLGenerator = destinationURLGenerator
    self.contentBuilder = contentBuilder
    self.postFilters = postFilters
  }

  /// Creates a directory with the given name in the specified content path URL.
  ///
  /// - Parameters:
  ///   - directoryName: The name of the directory to create.
  ///   - contentPathURL: The content path URL.
  /// - Throws: An error if the directory creation fails.
  private func createDirectory(
    withName directoryName: String,
    in contentPathURL: URL
  ) throws {
    let directoryURL = contentPathURL.appendingPathComponent(
      directoryName,
      isDirectory: true
    )

    if !FileManager.default.fileExists(atPath: directoryURL.path) {
      try FileManager.default.createDirectory(
        at: directoryURL,
        withIntermediateDirectories: true
      )
    }
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
    atAssetRoot assetRoot: String,
    to contentPathURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromPost: ((WordPressPost) -> String)? = nil
  ) throws {
    try allPosts.forEach { args in
      try createDirectory(withName: args.key, in: contentPathURL)
      try args.value
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          // @Leo, it might find a pdf as first match
          // From the list of images attached to this post,
          // choose the first one as featuredImage
          let featuredImagePath = assets.first { $0.parentID == post.ID }.map {
            ["", assetRoot, $0.newPath].joined(separator: "/")
          }

          _ = try self.contentBuilder.write(
            from: .init(
              sectionName: args.key,
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

  /**
   1. Go through posts and find all assets
   2. Modify all posts with their new urls
   3. Download from remote site OR copy from local depending on options passed
   */

  /// Begins the processing of the WordPress posts.
  ///
  /// - Parameter settings: The required settings for processing WordPress exports.
  /// - Throws: An error if the processing failed at any step.
  mutating public func begin(withSettings settings: WordPressMarkdownProcessorSettings) throws {

    // 1. Decodes WordPress posts from exports directory.
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.directoryURL)

    // 2. Writes redirects for all decoded WordPress posts.
    try redirectListGenerator.writeRedirects(
      fromPosts: allPosts,
      formattedWith: redirectFromatter,
      inDirectory: settings.resourcesPathURL
    )

    // 3. Calculate assets root path for assets under resources directory.
    // ex: media/wp-images is the relative path directory built from /Resources/media/wp-images and /Resources
    let assetRoot = settings.resourceImagePathURL.relativePath(
      from: settings.resourcesPathURL
    ) ?? settings.resourcesPathURL.path

    // 4. Build asset imports from all posts
    let assetsImports: [WordPressAssetImport] = {
      allPosts
        .flatMap(\.value)
        .filter { $0.type == "post" }
        .map { post in
          (
            try? NSRegularExpression(pattern: "\(settings.assetsSiteURL)/wp-content/uploads([^\"]+)")
              .matches(
                in: post.body,
                range: NSRange(post.body.startIndex..., in: post.body)
              )
              .map { match in
                String(post.body[Range(match.range, in: post.body)!])
              }
              .compactMap {
                WordPressAssetImport(
                  forPost: post,
                  oldUrl: String($0),
                  assetRoot: assetRoot,
                  assetSiteURL: settings.assetsSiteURL
                )
              }
          ) ?? []
        }
        .flatMap { $0 }

    }()

    // 5. Get ready to download all assets
    if let importImagePathURL = settings.importImagePathURL {
      downloader = AssetDownloader(
        downloadPathFromURL: { url in
          return (["default"] + url.pathComponents.suffix(3)).joined(separator: "/")
        },
        downloadURLFromURL: { url in
          return importImagePathURL.appendingPathComponent(url.path)
        }
      )
    }

    try downloader.download(
      assets: assetsImports,
      to: settings.resourceImagePathURL,
      dryRun: settings.skipDownload,
      allowsOverwrites: settings.overwriteImages
    )

    // 6. To modify asset urls with local path instead
    let htmlFromPost: ((WordPressPost) -> String) = { post in
      post.body.replacingOccurrences(
        of: "\(settings.assetsSiteURL)/wp-content/uploads",
        with: "/\(assetRoot)/default"
      )
    }

    // 7. Starts writing the markdown files for all WordPress post,
    try writeAllPosts(
      allPosts,
      withAssets: assetsImports,
      atAssetRoot: assetRoot,
      to: settings.contentPathURL,
      using: type(of: settings).markdownFrom(html:),
      htmlFromPost: htmlFromPost
    )
  }
}

extension WordPressMarkdownProcessor {
  private typealias WordPressFrontMatterYAMLExporter = FrontMatterYAMLExporter<
    WordPressSource,
    SpecFrontMatterTranslator
  >

  /// Initializes a new `WordPressMarkdownProcessor` instance with default values for
  /// `ContentURLGeneratorType` and `MarkdownContentBuilderType`.
  ///
  /// - Parameter postFilters: The post filters.
  public init(postFilters: [PostFilter]) where
    ContentURLGeneratorType == SectionContentURLGenerator,
    MarkdownContentBuilderType == MarkdownContentYAMLBuilder<
      WordPressSource,
      FilteredHTMLMarkdownExtractor<WordPressSource>,
      FrontMatterYAMLExporter<WordPressSource, SpecFrontMatterTranslator>
    > {
    self.init(
      redirectListGenerator: DynamicRedirectGenerator(postFilters: postFilters),
      destinationURLGenerator: .init(),
      contentBuilder: .init(
        frontMatterExporter: WordPressFrontMatterYAMLExporter(
          translator: SpecFrontMatterTranslator()
        ),
        markdownExtractor: FilteredHTMLMarkdownExtractor<WordPressSource>()
      ),
      postFilters: postFilters
    )
  }
}
