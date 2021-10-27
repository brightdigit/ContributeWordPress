import ArgumentParser
import Foundation
import Publish
import ShellOut
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
extension URL {
  func relativePath(from base: URL) -> String? {
    // Ensure that both URLs represent files:
    guard isFileURL, base.isFileURL else {
      return nil
    }

    // Remove/replace "." and "..", make paths absolute:
    let destComponents = standardized.pathComponents
    let baseComponents = base.standardized.pathComponents

    // Find number of common path components:
//    var i = 0
//    while i < destComponents.count, i < baseComponents.count, destComponents[i] == baseComponents[i] {
//      i += 1
    // }
    let index = (zip(baseComponents, destComponents).enumerated().first { element in
      element.element.0 != element.element.1
    }?.offset ?? min(baseComponents.count, destComponents.count))

    // Build relative path:
    var relComponents = Array(repeating: "..", count: baseComponents.count - index)
    relComponents.append(contentsOf: destComponents[index...])
    return relComponents.joined(separator: "/")
  }
}

public struct WordpressMarkdownProcessor {
  internal init(postFilters: [PostFilter]) {
    self.postFilters = postFilters
    redirectListGenerator = DynamicRedirectGenerator(postFilters: postFilters)
  }

  let redirectListGenerator: RedirectListGenerator
  let redirectFromatter: RedirectFormatter = NetlifyRedirectFormatter()
  let downloader: Downloader = ImageDownloader()
  let exportDecoder: PostsExportDecoder = PostsExportSynDecoder()
  let destinationURLGenerator: ContentURLGenerator = SectionContentURLGenerator()
  let contentBuilder: MarkdownContentBuilder = MarkdownContentYAMLBuilder()
  let postFilters: [PostFilter]

  private func writeAllPosts(_ allPosts: [String: [WordPressPost]], withImages images: [WordPressImageImport], atImageRoot imageRoot: String, to contentPathURL: URL) throws {
    try allPosts.forEach { args in
      let fileName = args.key
      return try args.value
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          let featuredImagePath = images.first(where: { $0.parentID == post.ID }).map {
            ["", imageRoot, $0.newPath].joined(separator: "/")
          }

          try self.contentBuilder.writePost(post, withFeaturedImage: featuredImagePath, fromFileName: fileName, atContentPathURL: contentPathURL, basedOn: self.destinationURLGenerator)
        }
    }
  }

  func begin(withSettings settings: WordPressMarkdownProcessorSettings) throws {
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.directoryURL)

    try redirectListGenerator.writeRedirects(fromPosts: allPosts, formattedWith: redirectFromatter, inDirectory: settings.resourcesPathURL)
    let imageImports = try downloader.download(fromPosts: allPosts.flatMap(\.value), to: settings.resourceImagePathURL, dryRun: settings.skipDownload, allowsOverwrites: settings.overwriteImages)
    let imageRoot = settings.resourceImagePathURL.relativePath(from: settings.resourcesPathURL) ?? settings.resourcesPathURL.path
    try writeAllPosts(allPosts, withImages: imageImports, atImageRoot: imageRoot, to: settings.contentPathURL)
  }
}
