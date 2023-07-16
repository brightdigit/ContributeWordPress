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
  private let redirectListGenerator: RedirectListGenerator
  private let redirectFromatter: RedirectFormatter = NetlifyRedirectFormatter()
  private let downloader: Downloader = ImageDownloader()
  private let exportDecoder: PostsExportDecoder = PostsExportSynDecoder()
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
  /// It creates the content directory if not already existed, where the posts are going
  /// to be written at.
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
    using htmlToMarkdown: @escaping (String) throws -> String
  ) throws {
    try allPosts.forEach { args in
      try createDirectory(withName: args.key, in: contentPathURL)
      try args.value
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          let featuredImagePath = images.first { $0.parentID == post.ID }.map {
            ["", imageRoot, $0.newPath].joined(separator: "/")
          }

          _ = try self.contentBuilder.write(
            from: .init(
              sectionName: args.key,
              post: post,
              featuredImage: featuredImagePath
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
  /// - Parameter settings: The WordPress Markdown processor settings.
  /// - Throws: An error if the processing fails.
  public func begin(withSettings settings: WordPressMarkdownProcessorSettings) throws {
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.directoryURL)

    try redirectListGenerator.writeRedirects(
      fromPosts: allPosts,
      formattedWith: redirectFromatter,
      inDirectory: settings.resourcesPathURL
    )

    let imageImports = try downloader.download(
      fromPosts: allPosts.flatMap(\.value),
      to: settings.resourceImagePathURL,
      dryRun: settings.skipDownload,
      allowsOverwrites: settings.overwriteImages
    )

    let imageRoot = settings.resourceImagePathURL.relativePath(
      from: settings.resourcesPathURL
    ) ?? settings.resourcesPathURL.path

    try writeAllPosts(
      allPosts,
      withImages: imageImports,
      atImageRoot: imageRoot,
      to: settings.contentPathURL,
      using: type(of: settings).markdownFrom(html:)
    )
  }
}

extension WordPressMarkdownProcessor {
  public typealias WordPressFrontMatterYAMLExporter = FrontMatterYAMLExporter<
    WordPressSource,
    SpecFrontMatterTranslator
  >

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
