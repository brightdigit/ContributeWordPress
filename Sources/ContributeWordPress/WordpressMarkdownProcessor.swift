import Contribute
import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct WordpressMarkdownProcessor<
  ContentURLGeneratorType: ContentURLGenerator,
  MarkdownContentBuilderType: MarkdownContentBuilder
>
  where
  ContentURLGeneratorType.SourceType == WordPressSource,
  MarkdownContentBuilderType.SourceType == WordPressSource {
  public init(redirectListGenerator: RedirectListGenerator, destinationURLGenerator: ContentURLGeneratorType, contentBuilder: MarkdownContentBuilderType, postFilters: [PostFilter]) {
    self.redirectListGenerator = redirectListGenerator
    self.destinationURLGenerator = destinationURLGenerator
    self.contentBuilder = contentBuilder
    self.postFilters = postFilters
  }

  let redirectListGenerator: RedirectListGenerator
  let redirectFromatter: RedirectFormatter = NetlifyRedirectFormatter()
  let downloader: Downloader = ImageDownloader()
  let exportDecoder: PostsExportDecoder = PostsExportSynDecoder()
  let destinationURLGenerator: ContentURLGeneratorType
  let contentBuilder: MarkdownContentBuilderType
  let postFilters: [PostFilter]

  fileprivate func createDirectory(withName directoryName: String, in contentPathURL: URL) throws {
    let directoryURL = contentPathURL.appendingPathComponent(directoryName, isDirectory: true)

    if !FileManager.default.fileExists(atPath: directoryURL.path) {
      try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true)
    }
  }

  private func writeAllPosts(_ allPosts: [String: [WordPressPost]], withImages images: [WordPressImageImport], atImageRoot imageRoot: String, to contentPathURL: URL, using htmlToMarkdown: @escaping (String) throws -> String) throws {
    try allPosts.forEach { args in
      try createDirectory(withName: args.key, in: contentPathURL)
      try args.value
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          let featuredImagePath = images.first(where: { $0.parentID == post.ID }).map {
            ["", imageRoot, $0.newPath].joined(separator: "/")
          }

          _ = try self.contentBuilder.write(from: .init(sectionName: args.key, post: post, featuredImage: featuredImagePath), atContentPathURL: contentPathURL, basedOn: self.destinationURLGenerator, using: htmlToMarkdown)
        }
    }
  }

  public func begin(withSettings settings: WordPressMarkdownProcessorSettings) throws {
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.directoryURL)

    try redirectListGenerator.writeRedirects(fromPosts: allPosts, formattedWith: redirectFromatter, inDirectory: settings.resourcesPathURL)
    let imageImports = try downloader.download(fromPosts: allPosts.flatMap(\.value), to: settings.resourceImagePathURL, dryRun: settings.skipDownload, allowsOverwrites: settings.overwriteImages)
    let imageRoot = settings.resourceImagePathURL.relativePath(from: settings.resourcesPathURL) ?? settings.resourcesPathURL.path

    try writeAllPosts(allPosts, withImages: imageImports, atImageRoot: imageRoot, to: settings.contentPathURL, using: type(of: settings).markdownFrom(html:))
  }
}

extension WordpressMarkdownProcessor {
  public init(postFilters: [PostFilter]) where ContentURLGeneratorType == SectionContentURLGenerator, MarkdownContentBuilderType == MarkdownContentYAMLBuilder<WordPressSource, FilteredHTMLMarkdownExtractor<WordPressSource>, FrontMatterYAMLExporter<WordPressSource, SpecFrontMatterTranslator>> {
    self.init(
      redirectListGenerator: DynamicRedirectGenerator(postFilters: postFilters),
      destinationURLGenerator: .init(),
      contentBuilder: .init(
        frontMatterExporter: FrontMatterYAMLExporter<WordPressSource, SpecFrontMatterTranslator>(translator: SpecFrontMatterTranslator()),
        markdownExtractor: FilteredHTMLMarkdownExtractor<WordPressSource>()
      ),
      postFilters: postFilters
    )
  }
}
