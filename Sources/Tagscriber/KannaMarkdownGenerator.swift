import Kanna
import MarkdownGenerator

public struct KannaMarkdownGenerator: MarkdownGenerator {
  // swiftlint:disable:next cyclomatic_complexity
  func markdown(from element: Kanna.XMLElement) throws -> MarkdownConvertible? {
    switch (element.tagName, element.text) {
    case let ("h4", .some(text)):
      return MarkdownHeader(title: text, level: .h3, style: .atx)
    case ("hr", _):
      return "\n---\n"
    case ("em", _):

      return try ["_"] + element.xpath("/*").compactMap(markdown(from:)) + ["_"]
    case ("img", _):

      let altText = element.at_xpath("@alt")?.content ?? ""
      return element.at_xpath("@src")?.content.map {
        MarkdownImage(url: $0, altText: altText)
      }
    case ("script", _):
      return nil
    case let ("h5", .some(text)):
      return MarkdownHeader(title: text, level: .h5, style: .atx)
    case ("ul", _):
      return try MarkdownList(items: element.xpath("/li").compactMap(markdown(from:)), style: .unordered)
    case ("pre", _):
      return try element.xpath("/code").map(markdown(from:))
    case ("figure", _):
      return nil
    case let ("h2", .some(text)):
      return MarkdownHeader(title: text, level: .h2, style: .atx)
    case ("ol", _):
      return try MarkdownList(items: element.xpath("/li").compactMap(markdown(from:)), style: .ordered)

    case let ("a", .some(text)):
      guard let href = element.at_xpath("@href")?.content else {
        return text
      }

      return "[" + text + "](" + href + ")"
    case ("dl", _):
      return try MarkdownList(items: element.xpath("/li").compactMap(markdown(from:)), style: .unordered)

    case let ("strong", .some(text)):

      return "**" + text + "**"
    case let ("code", .some(text)):
      return MarkdownCodeBlock(code: text, style: .backticks(language: "swift"))
    case let ("div", .some(text)):
      return "\n" + text + "\n"
    case ("ins", _):
      return nil
    case let ("p", .some(text)):
      return "\n" + text + "\n"
    case let ("h1", .some(text)):
      return MarkdownHeader(title: text, level: .h1, style: .atx)
    case let ("blockquote", .some(text)):

      return MarkdownBlockquotes(content: text)
    case ("iframe", _):
      return nil
    case let ("span", .some(text)):
      return "\n" + text + "\n"
    case let ("h3", .some(text)):
      return MarkdownHeader(title: text, level: .h3, style: .atx)
    case let ("li", .some(text)):
      return text
    default:
      return nil
    }
  }

  public func markdown(fromHTML htmlString: String) throws -> String {
    var tags = Set<String>()
    let html = try Kanna.HTML(html: htmlString, encoding: .utf8)

    html.body?.xpath("/*").forEach { element in
      tags.formUnion([element.tagName].compactMap { $0 })
    }
    let markdowns = try (html.body?.xpath("/*").compactMap(markdown(from:)) ?? [])
    return markdowns.markdown.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
