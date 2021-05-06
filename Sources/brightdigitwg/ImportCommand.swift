import ArgumentParser
import Foundation
import Kanna
import MarkdownGenerator
import Publish
import Yams
import ShellOut

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
      let imageUrlsAray = allPosts.values.flatMap { $0 }.compactMap { try? Kanna.HTML(html: $0.body, encoding: .utf8) }.compactMap(\.body).flatMap {
        $0.xpath("//img/@src")
      }.compactMap(\.content).compactMap(URL.init(string:))

      let imageURLs = Set(imageUrlsAray)

      let imagePaths: [URL: String] = imageURLs.map { url in
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
        URLSession.shared.downloadTask(with: url) { destination, _, error in
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
            //let process = Process()
            //let input = Pipe()
            //process.standardInput = input
            //input.fileHandleForReading.write(post.body.data(using: .utf8)!)
            let temporaryDirURL = URL(fileURLWithPath: NSTemporaryDirectory(),  isDirectory: true)
            let temporaryFileURL = temporaryDirURL.appendingPathComponent(UUID().uuidString)
            try post.body.write(to: temporaryFileURL, atomically: true, encoding: .utf8)
            let markdownText = try shellOut(to: "/usr/local/bin/pandoc", arguments: ["-f html -t markdown", temporaryFileURL.path])
//            let html = try Kanna.HTML(html: post.body, encoding: .utf8)
//
//            html.body?.xpath("/*").map { element in
//              tags.formUnion([element.tagName].compactMap { $0 })
//            }
//            let markdowns = try [MarkdownHeader(title: post.title)] + (html.body?.xpath("/*").compactMap(markdown(from:)) ?? []) ?? []
            let specs = Specs(fromPost: post)
            let encoder = YAMLEncoder()

            let frontMatter = try encoder.encode(specs).trimmingCharacters(in: .whitespacesAndNewlines)
//
//            let markdownText = markdowns.markdown.trimmingCharacters(in: .whitespacesAndNewlines)
              let file = sectionPath.appendingComponent(post.name + ".md")
              let text = ["---", frontMatter, "---", markdownText].joined(separator: "\n")
//
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
