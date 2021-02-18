import ArgumentParser
import Foundation
import Ink
import Kanna
import MarkdownGenerator
import Plot
import Publish
import ShellOut
import Splash
import Yams

public extension Plugin {
  static func splash(withClassPrefix classPrefix: String) -> Self {
    Plugin(name: "Splash") { context in
      context.markdownParser.addModifier(
        .splashCodeBlocks(withFormat: HTMLOutputFormat(
          classPrefix: classPrefix
        ))
      )
    }
  }
}

public extension Modifier {
  static func splashCodeBlocks(withFormat format: HTMLOutputFormat = .init()) -> Self {
    let highlighter = SyntaxHighlighter(format: format)

    return Modifier(target: .codeBlocks) { html, markdown in
      var markdown = markdown.dropFirst("```".count)

      guard !markdown.hasPrefix("no-highlight") else {
        return html
      }

      markdown = markdown
        .drop(while: { !$0.isNewline })
        .dropFirst()
        .dropLast("\n```".count)

      let highlighted = highlighter.highlight(String(markdown))
      return "<pre><code>" + highlighted + "\n</code></pre>"
    }
  }
}

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
    print(element.tagName, element.content)
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
    print(element.tagName, element.text)
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
    print(element.tagName)
    return nil
  }
}

extension Optional {
  func flatMap<OtherValueType>(and other: OtherValueType?) -> (Wrapped, OtherValueType)? {
    flatMap { value in
      other.map {
        (value, $0)
      }
    }
  }
}

public struct Specs: Codable {
  public init(date: Date, description: String?, tags: [String]) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = .current
    self.date = dateFormatter.string(from: date)
    self.description = description
    self.tags = tags.isEmpty ? nil : tags.joined(separator: ", ")
  }

  let date: String
  let description: String?
  let tags: String?
}

public extension Specs {
  init(fromPost post: WordpressPost) {
    self.init(date: post.date, description: post.meta["_yoast_wpseo_metadesc"], tags: post.tags)
  }
}

public struct MarkdownItem {
  internal init(specs: Specs, markdown: MarkdownConvertible) {
    self.specs = specs
    self.markdown = markdown
  }

  let specs: Specs
  let markdown: MarkdownConvertible
}

public struct WordpressPost {
  internal init(name: String, title: String, link: URL, meta: [String: String], body: String, date: Date, tags: [String]?, categories: [String]?) {
    self.link = link
    self.name = name
    self.title = title
    self.meta = meta
    self.body = body
    self.date = date
    self.tags = tags ?? .init()
    self.categories = categories ?? .init()
  }

  public static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
    return formatter
  }()

  public let name: String
  public let link: URL
  public let title: String
  public let meta: [String: String]
  public let body: String
  public let date: Date
  public let tags: [String]
  public let categories: [String]
}

public extension WordpressPost {
  init?(element: Kanna.XMLElement) {
    let tacs = element.xpath("/category").compactMap { (element) -> (String, String)? in
      guard let domain = element.at_xpath("@domain")?.content else {
        return nil
      }

      guard let text = element.content else {
        return nil
      }

      guard text != "Uncategorized" else {
        return nil
      }

      return (domain, text)
    }.groupByKey()

    guard let link = element.at_css("link")?.text.flatMap(URL.init(string:)) else {
      return nil
    }
    guard let title = element.at_css("title")?.content else {
      return nil
    }
    guard let pubDateString = element.at_css("pubDate")?.content else {
      return nil
    }
    guard let pubDate = Self.dateFormatter.date(from: pubDateString) else {
      return nil
    }
    guard let contentElement = element.at_xpath("content:encoded", namespaces: ["content": "http://purl.org/rss/1.0/modules/content/"]) else {
      return nil
    }
    guard let body = contentElement.text else {
      return nil
    }
    guard let name = element.at_xpath("wp:post_name", namespaces: ["wp": "http://wordpress.org/export/1.2/"])?.text else {
      print(title)
      return nil
    }
    let metaElems = element.css("wp:postmeta", namespaces: ["wp": "http://wordpress.org/export/1.2/"])
    let meta = metaElems.compactMap { (element) -> (String, String)? in
      let key = element.at_css("wp:meta_key", namespaces: ["wp": "http://wordpress.org/export/1.2/"])?.content
      let value = element.at_css("wp:meta_value", namespaces: ["wp": "http://wordpress.org/export/1.2/"])?.content
      return key.flatMap(and: value)
    }.uniqueByKey()

    self.init(name: name, title: title, link: link, meta: meta, body: body, date: pubDate, tags: tacs["post_tag"], categories: tacs["category"])
  }
}

extension Sequence {
  // @inlinable public init<S>(uniqueKeysWithValues keysAndValues: S) where S : Sequence, S.Element == (Key, Value)
  func uniqueByKey<Key: Hashable, Value>() -> [Key: Value] where Element == (Key, Value) {
    return Dictionary(uniqueKeysWithValues: self)
  }

  func groupByKey<Key: Hashable, Value>() -> [Key: [Value]] where Element == (Key, Value) {
    return Dictionary(grouping: self, by: { $0.0 }).mapValues { $0.map(\.1) }
  }
}

// This type acts as the configuration for your website.
struct BrightDigit: Website {
  enum SectionID: String, WebsiteSectionID {
    // Add the sections that you want your website to contain here:
    case articles
    case episodes
    case videos
    case tutorials
  }

  struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
  }

  // Update these properties to configure your website:
  var url = URL(string: "https://brightdigit.com")!
  var name = "BrightDigit"
  var description = "A description of BrightdigitCom"
  var language: Language { .english }
  var imagePath: Path? { nil }
}

extension Plugin {
  @available(OSX 10.12, *)
  static var tailwindCss: Self {
    Plugin(name: "Tailwind") { context in
      let folder = try context.folder(at: "Content/styling")
      let cssFile = try context.createOutputFile(at: "css/styles.css")
      try shellOut(to: "npm run publish -- -o \(cssFile.url.absoluteString)", at: folder.path)
    }
  }
}

extension PublishingStep {
  static var tailwindCSS: Self {
    .step(named: "Create CSS From TailwindCSS") { context in
      let folder = try context.folder(at: "Styling")
      let cssFile = try context.createOutputFile(at: "css/styles.css")

      try shellOut(to: "npm install; npm run publish -- -o \(cssFile.path)", at: folder.path)
    }
  }
}

public struct BrightDigitSiteCommand: ParsableCommand {
  public init() {}

  public static var configuration = CommandConfiguration(
    abstract: "Command for maintaining the BrightDigit site.",
    subcommands: [PublishCommand.self, ImportCommand.self],
    defaultSubcommand: PublishCommand.self
  )
}

public extension BrightDigitSiteCommand {
  struct PublishCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(commandName: "publish")
    public init() {}

    public func run() throws {
      try BrightDigit().publish(using: [
        .optional(.copyResources()),
        .installPlugin(.splash(withClassPrefix: "")),
        .addMarkdownFiles(),
        .sortItems(by: \.date, order: .descending),

        .generateHTML(withTheme: .company, indentation: .spaces(2)),
        .generateSiteMap(),

        .tailwindCSS,
        .generateRSSFeed(including: [.articles, .tutorials])
      ])
    }
  }
}

public enum SiteImportType: String, ExpressibleByArgument {
  case wordpress
}

public extension BrightDigitSiteCommand {
  struct ImportCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(commandName: "import")
    @Option
    public var type: SiteImportType = .wordpress

    @Argument
    public var directory: String

    public init() {}

    public func run() throws {
      let directoryURL = URL(fileURLWithPath: directory)

      guard let enumerator = FileManager.default.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else {
        return
      }

      let namesAndDocs: [(String, Kanna.XMLDocument)] = enumerator
        .compactMap { $0 as? URL }
        .compactMap { url in
          let ext = url.pathExtension.lowercased()
          let name = url.deletingPathExtension().lastPathComponent

          guard ext == "xml" else {
            return nil
          }

          let doc: Kanna.XMLDocument
          do {
            doc = try XML(url: url, encoding: .utf8)
          } catch {
            print(error)
            return nil
          }

          return (name, doc)
        }

      let dictionary = namesAndDocs.uniqueByKey()

      var allPosts = [String: [WordpressPost]]()

      for (name, doc) in dictionary {
        let elementsByType: [String: [Kanna.XMLElement]] =
          doc.xpath("/rss/channel/item").compactMap { element in

            element.at_xpath("wp:post_type", namespaces: ["wp": "http://wordpress.org/export/1.2/"]).flatMap(\.content).map {
              ($0, element)
            }
          }.groupByKey()

        let posts = elementsByType["post"]?.compactMap(WordpressPost.init(element:))

        allPosts[name] = posts
      }

      var tags = Set<String>()

      let contentPath = Path("/Users/leo/Documents/Projects/brightdigit.com/Content")
      let resourceImagePath = Path("/Users/leo/Documents/Projects/brightdigit.com/Resources/media/images")
      let redirects = allPosts.flatMap { (args) -> [(String, String)] in
        let (dir, posts) = args
        return posts.map { post in
          (post.link.path, ["", dir, post.name].joined(separator: "/"))
        }
      }

      // swiftlint:disable:next force_try
      try! redirects.map { [$0.0, $0.1].joined(separator: "\t") }.joined(separator: "\n").write(toFile: contentPath.appendingComponent("_redirects").absoluteString, atomically: true, encoding: .utf8)
      let imageUrlsAray = allPosts.values.flatMap{$0}.compactMap{try? Kanna.HTML(html: $0.body, encoding: .utf8)}.compactMap {
        $0.body
      }.flatMap {
        $0.xpath("//img/@src")
      }.compactMap{
        $0.content
      }.compactMap(URL.init(string:))
      
      let imageURLs = Set(imageUrlsAray)
      
      let imagePaths : [URL : String] = imageURLs.map{ (url) in
        let directoryPrefix = url.host?.components(separatedBy: ".").first ?? "default"
        let path = ([directoryPrefix] + url.pathComponents.suffix(3)).joined(separator: "/")
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
          return (url, path)
        }
        components.query = nil
        guard let newURL = components.url else {
          return (url, path)
        }
        return (newURL, path)
      }.uniqueByKey()
      
      let group = DispatchGroup()
      
      for (url, path) in imagePaths {
        group.enter()
        URLSession.shared.downloadTask(with: url) { (destination, _, error) in
          if let error = error {
            print(url, path, error)
          } else if let sourceURL = destination {
            let destinationPath = resourceImagePath.appendingComponent(path)
            let destinationURL = URL(fileURLWithPath: destinationPath.string)
            try? FileManager.default.createDirectory(at: destinationURL.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
            do {
              try FileManager.default.copyItem(at: sourceURL, to: destinationURL)
            } catch {
                print(url, path)
            }
          }
          group.leave()
        }.resume()
      }
      
      group.wait()
      
      allPosts.forEach { args in
        let sectionPath = contentPath.appendingComponent(args.key)
        args.value.forEach { post in
          guard !post.name.starts(with: "empowerapps-show") else {
            return
          }
          let section = args.key
          do {
            let html = try Kanna.HTML(html: post.body, encoding: .utf8)
            
            
            html.body?.xpath("/*").map { element in
              tags.formUnion([element.tagName].compactMap { $0 })
            }
            let markdowns = try [MarkdownHeader(title: post.title)] + (html.body?.xpath("/*").compactMap(markdown(from:)) ?? []) ?? []
            let specs = Specs(fromPost: post)
            let encoder = YAMLEncoder()

            let frontMatter = try encoder.encode(specs).trimmingCharacters(in: .whitespacesAndNewlines)

            let markdownText = markdowns.markdown.trimmingCharacters(in: .whitespacesAndNewlines)
            let file = sectionPath.appendingComponent(post.name + ".md")
            let text = ["---", frontMatter, "---", markdownText].joined(separator: "\n")

            // swiftlint:disable:next force_try
            try! text.write(toFile: file.absoluteString, atomically: true, encoding: .utf8)
          } catch {
            print(error)
          }
        }
      }
      // print(tags)
    }
  }
}

BrightDigitSiteCommand.main()
