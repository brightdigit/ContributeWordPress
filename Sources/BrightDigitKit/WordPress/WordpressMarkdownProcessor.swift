import ArgumentParser
import Foundation
import Publish
import ShellOut
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct WordpressMarkdownProcessor {
  let redirectListGenerator: RedirectListGenerator = DynamicRedirectGenerator()
  let redirectFromatter: RedirectFormatter = NetlifyRedirectFormatter()
  let downloader: Downloader = ImageDownloader()
  let exportDecoder: PostsExportDecoder = PostsExportSynDecoder()
  let destinationURLGenerator: ContentURLGenerator = SectionContentURLGenerator()
  let contentBuilder: MarkdownContentBuilder = MarkdownContentYAMLBuilder()
  let postFilters: [PostFilter]

  private func writeAllPosts(_ allPosts: [String: [WordPressPost]], to contentPathURL: URL) throws {
    try allPosts.forEach { args in
      let fileName = args.key
      return try args.value
        .filter(self.postFilters.postSatisfiesAll)
        .forEach { post in
          try self.contentBuilder.writePost(post, fromFileName: fileName, atContentPathURL: contentPathURL, basedOn: self.destinationURLGenerator)
        }
    }
  }

  func begin(withSettings settings: WordPressMarkdownProcessorSettings) throws {
    let allPosts = try exportDecoder.posts(fromExportsAt: settings.directoryURL)
    try redirectListGenerator.writeRedirects(fromPosts: allPosts, formattedWith: redirectFromatter, inDirectory: settings.resourcesPathURL)
    try downloader.download(fromPosts: allPosts.flatMap(\.value), to: settings.resourceImagePathURL)
    try writeAllPosts(allPosts, to: settings.contentPathURL)
  }
}
