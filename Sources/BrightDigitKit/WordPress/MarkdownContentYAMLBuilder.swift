import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct MarkdownContentYAMLBuilder: MarkdownContentBuilder {
  let preFilters: [(String) throws -> (String)] = []
  let postFilters: [(String) throws -> (String)] = []
  let frontMatterExporter: FrontMatterExporter = FrontMatterYAMLExporter()
  let contentFormatter: FrontMatterMarkdownFormatter = SimpleFrontMatterMarkdownFormatter()
  let markdownGenerator: MarkdownGenerator = PandocMarkdownGenerator()

  public func content(fromPost post: WordPressPost, withFeaturedImage featuredImage: String?) throws -> String {
    let body = try preFilters.reduce(post.body) { try $1($0) }
    let rawMarkdown = try markdownGenerator.markdown(fromHTML: body)
    let markdownText = try postFilters.reduce(rawMarkdown) { try $1($0) }
    let frontMatterText = try frontMatterExporter.frontMatterText(fromWordPressPost: post, withFeaturedImage: featuredImage)
    return contentFormatter.format(frontMatterText: frontMatterText, withMarkdown: markdownText)
  }
}
