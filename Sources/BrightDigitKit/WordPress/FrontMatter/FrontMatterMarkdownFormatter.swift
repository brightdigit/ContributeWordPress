public protocol FrontMatterMarkdownFormatter {
  func format(frontMatterText: String, withMarkdown markdownText: String) -> String
}
