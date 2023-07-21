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
  private var downloader: Downloader = ImageDownloader()
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
  ///   - images: An array of images that were imported from WordPress posts.
  ///   - imageRoot: The root path of the images directory.
  ///   - contentPathURL: The content path URL.
  ///   - htmlToMarkdown: A function that converts HTML to Markdown.
  /// - Throws: An error if an error occurs.
  private func writeAllPosts(
    _ allPosts: SectionPostDictionary,
    withImages images: [WordPressImageImport],
    atImageRoot imageRoot: String,
    to contentPathURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromPost: ((WordPressPost) -> String)? = nil
  ) throws {
    try allPosts.forEach { args in
      try createDirectory(withName: args.key, in: contentPathURL)
      try args.value
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          // From the list of images attached to this post,
          // choose the first one as featuredImage
          let featuredImagePath = images.first { $0.parentID == post.ID }.map {
            ["", imageRoot, $0.newPath].joined(separator: "/")
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

    // Prepare ImageDownloader with custom url builders, if a local images directory
    // is provided to import images from.
    if let importImagePathURL = settings.importImagePathURL {
      downloader = ImageDownloader(
        downloadURLFromURL: { url in
          return importImagePathURL.appendingPathComponent(url.path)
        },
        downloadPathFromURL: { url in
          // TODO: I am a bit confused why .suffix(3) worked here, please recheck.
          return (["default"] + url.pathComponents.suffix(3)).joined(separator: "/")
        }
      )
    }

    // 3. Download images for all decoded WordPress posts so far.
    let imageImports = try downloader.download(
      fromPosts: allPosts.flatMap(\.value),
      to: settings.resourceImagePathURL,
      dryRun: settings.skipDownload,
      allowsOverwrites: settings.overwriteImages
    )

    // 4. Builds a relative path representing image resources under
    //    resources directory.
    // ex: media/wp-images is the relative path directory built from /Resources/media/wp-images and /Resources
    let imageRoot = settings.resourceImagePathURL.relativePath(
      from: settings.resourcesPathURL
    ) ?? settings.resourcesPathURL.path

    let htmlFromPost: ((WordPressPost) -> String)?
    if let imagesRootURL = settings.imagesRootURL {
      htmlFromPost = { post in
        post.body.replacingOccurrences(
          of: "\(imagesRootURL)/wp-content/uploads",
          with: "/\(imageRoot)/default"
        )
      }
    } else {
      htmlFromPost = nil
    }

    // 5. Starts writing the markdown files for all WordPress post,
    try writeAllPosts(
      allPosts,
      withImages: imageImports,
      atImageRoot: imageRoot,
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
