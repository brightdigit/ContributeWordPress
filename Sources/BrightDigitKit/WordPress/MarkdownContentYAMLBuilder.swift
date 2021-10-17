import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct MarkdownContentYAMLBuilder: MarkdownContentBuilder {
  let frontMatterExporter: FrontMatterExporter = FrontMatterYAMLExporter()
  let contentFormatter: FrontMatterMarkdownFormatter = SimpleFrontMatterMarkdownFormatter()
  let markdownGenerator: MarkdownGenerator = PandocMarkdownGenerator()

  public func content(fromPost post: WordPressPost) throws -> String {
    let markdownText = try markdownGenerator.markdown(fromHTML: post.body)
    let frontMatterText = try frontMatterExporter.frontMatterText(fromWordPressPost: post)
    return contentFormatter.format(frontMatterText: frontMatterText, withMarkdown: markdownText)
  }
}
