import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct SimpleFrontMatterMarkdownFormatter: FrontMatterMarkdownFormatter {
  public func format(frontMatterText: String, withMarkdown markdownText: String) -> String {
    ["---", frontMatterText, "---", markdownText].joined(separator: "\n")
  }
}
