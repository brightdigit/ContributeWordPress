import ArgumentParser
import Foundation
import Kanna
import MarkdownGenerator
import Publish
import Yams
import ShellOut
import XMLCoder


public struct RSS: Codable, Equatable {
    let dc: URL
    let sy: URL
    let admin: URL
    let rdf: URL
    let content: URL
    let channel: Channel

    enum CodingKeys: String, CodingKey {
        case channel

        case dc = "xmlns:dc"
        case sy = "xmlns:sy"
        case admin = "xmlns:admin"
        case rdf = "xmlns:rdf"
        case content = "xmlns:content"
    }
}


public struct GeneratorAgent: Codable, Equatable {
    let resource: URL

    enum CodingKeys: String, CodingKey {
        case resource = "rdf:resource"
    }
}

public struct Channel: Codable, Equatable {
    let title: String
    let link: URL
    let description: String?
    let language: String
    let creator: String
    let rights: String
    let date: Date
    let generatorAgent: GeneratorAgent
    let image: Image
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case title, link, description, image

        case language = "dc:language"
        case creator = "dc:creator"
        case rights = "dc:rights"
        case date = "dc:date"
        case generatorAgent = "admin:generatorAgent"
        case items = "item"
    }
}

public enum BrightDigitError : Error {
  case unknown
}


public struct Image: Codable, Equatable {
    let url: URL
    let height: Int
    let width: Int
    let link: URL
    let title: String
}

public struct Item: Codable, Equatable {
    let title: String
    let link: URL
    let guid: URL
    let enclosure: Enclosure?
    let description: String
    let subject: String
    let date: Date
  let author: String?

    enum CodingKeys: String, CodingKey {
        case title, link, guid, enclosure, description

        case subject = "dc:subject"
        case date = "dc:date"
        case author
    }
}

public struct Enclosure: Codable, Equatable {
    let url: URL
    let length: String
    let type: String
}

public extension Result {
  init (success: Success?, failure: Failure?, otherwise: @autoclosure () -> Failure) {
    if let failure = failure {
      self = .failure(failure)
    } else if let success = success {
      self = .success(success)
    } else {
      self = .failure(otherwise())
    }
  }
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
      switch type {
      case .wordpress:
        try wordpress()
      case .mailchimp:
        try mailchimp()
      }
    }
    
    public func mailchimp() throws {
      URLSession.shared.dataTask(with: URL(string : "https://us12.campaign-archive.com/feed?u=cb3bba007ed171091f55c47f0&id=584d0d5c40")!) { data, _, error in
        let dataResult = Result(success: data, failure: error, otherwise: BrightDigitError.unknown)
        
      }
    
    }
    
    public func markdown(from html: String) throws -> String {
      let temporaryDirURL = URL(fileURLWithPath: NSTemporaryDirectory(),  isDirectory: true)
      let temporaryFileURL = temporaryDirURL.appendingPathComponent(UUID().uuidString)
      try html.write(to: temporaryFileURL, atomically: true, encoding: .utf8)
      return try shellOut(to: "/usr/local/bin/pandoc", arguments: ["-f html -t markdown", temporaryFileURL.path])
    }
    public func wordpress() throws {
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
            
            let markdownText = try markdown(from: post.body)
//            let html = try Kanna.HTML(html: post.body, encoding: .utf8)
//
//            html.body?.xpath("/*").map { element in
//              tags.formUnion([element.tagName].compactMap { $0 })
//            }
//            let markdowns = try [MarkdownHeader(title: post.title)] + (html.body?.xpath("/*").compactMap(markdown(from:)) ?? []) ?? []
            let specs = Specs(fromPost: post)
            let newPost = Post(frontmatter: specs, content: markdownText)
            let encoder = YAMLEncoder()
            let file = sectionPath.appendingComponent(post.name + ".md")
            
            try newPost.writeTo(file, using: encoder)

          } catch {
            print(error)
          }
        }
      }
      // print(tags)
    }
  }
}
