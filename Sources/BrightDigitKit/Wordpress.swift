import ArgumentParser
import Foundation
import Publish
import ShellOut
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension BrightDigitSiteCommand.ImportCommand {
  struct Wordpress: ParsableCommand {
    @Option
    public var exports: String

    @Option
    public var markdown: String

    @Option
    public var images: String

    public init() {}

    func postsFromExports(at directoryURL: URL) throws -> [String: [String: [WordPressPost]]] {
      let decoder = SynDecoder()
      guard let enumerator = FileManager.default.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else {
        throw ImportError.directory(directoryURL)
      }
      let feedPairs = enumerator.compactMap { $0 as? URL }.map { url in
        (url.deletingPathExtension().lastPathComponent, Result { try Data(contentsOf: url) })
      }
      let feeds = Dictionary(uniqueKeysWithValues: feedPairs).mapValues { result in
        result.flatMap { data in
          Result { try decoder.decode(data) }
        }
      }

      var allPosts = [String: [String: [WordPressPost]]]()
      for (name, result) in feeds {
        let feed: Feedable = try result.get()
        guard let rssFeed = feed as? RSSFeed else {
          continue
        }

        let posts = rssFeed.channel.items.compactMap(\.wpPost)
        allPosts[name] = Dictionary(grouping: posts, by: {
          $0.type
        })
      }

      return allPosts
    }

    func redirectText(fromAllPosts allPosts: [String: [String: [WordPressPost]]]) -> String {
      let redirects = allPosts.flatMap { args -> [(String, String)] in
        let (dir, posts) = args

        return posts["post"]?.filter { $0.link.path != "/" && $0.status == "publish" }.map { post in
          (post.link.path, ["", dir, post.name].joined(separator: "/"))
        } ?? []
      }

      return redirects.map { [$0.0, $0.1].joined(separator: "\t") }.joined(separator: "\n")
    }

    fileprivate func downloadAttachmentsFrom(_ allPosts: [String: [String: [WordPressPost]]], _ resourceImagePath: Path) throws {
      let imageURLs = Set(allPosts.values.compactMap {
        $0["attachment"]
      }.flatMap { $0 }.compactMap { post in
        post.attachmentURL
      })

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

      var errors = [URL: Error]()

      for (url, path) in imagePaths {
        group.enter()
        URLSession.shared.downloadTask(with: url) { destination, _, error in
          if let error = error {
            errors[url] = error
          } else if let sourceURL = destination {
            let destinationPath = resourceImagePath.appendingComponent(path)
            let destinationURL = URL(fileURLWithPath: destinationPath.string)
            do {
              try FileManager.default.createDirectory(at: destinationURL.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
              try FileManager.default.copyItem(at: sourceURL, to: destinationURL)
            } catch {
              errors[url] = error
            }
          }
          group.leave()
        }.resume()
      }

      group.wait()

      guard errors.isEmpty else {
        throw ImportError.imageDownloads(errors)
      }
    }

    enum ImportError: Error {
      case directory(URL)
      case imageDownloads([URL: Error])
    }

    fileprivate func markdown(fromPostBody postBody: String) throws -> String {
      let temporaryDirURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
      let temporaryFileURL = temporaryDirURL.appendingPathComponent(UUID().uuidString)
      try postBody.write(to: temporaryFileURL, atomically: true, encoding: .utf8)
      return try shellOut(to: "/usr/local/bin/pandoc", arguments: ["-f html -t markdown", temporaryFileURL.path])
    }

    fileprivate func writeMarkdownForPost(_ post: WordPressPost, at sectionPath: Path) throws {
      let markdownText = try markdown(fromPostBody: post.body)
      let specs = Specs(fromPost: post)
      let encoder = YAMLEncoder()
      let frontMatter = try encoder.encode(specs).trimmingCharacters(in: .whitespacesAndNewlines)
      let file = sectionPath.appendingComponent(post.name + ".md")
      let text = ["---", frontMatter, "---", markdownText].joined(separator: "\n")
      try text.write(toFile: file.absoluteString, atomically: true, encoding: .utf8)
    }

    public func run() throws {
      let contentPath = Path(markdown)
      let resourceImagePath = Path(images)
      let directoryURL = URL(fileURLWithPath: exports)
      let allPosts = try postsFromExports(at: directoryURL)

      let redirectsText = redirectText(fromAllPosts: allPosts)
      let redirectPath = contentPath.appendingComponent("_redirects").absoluteString
      try redirectsText.write(toFile: redirectPath, atomically: true, encoding: .utf8)

      try downloadAttachmentsFrom(allPosts, resourceImagePath)

      try allPosts.forEach { args in
        let sectionPath = contentPath.appendingComponent(args.key)
        try args.value["post"]?.forEach { post in
          guard !post.name.starts(with: "empowerapps-show") else {
            return
          }
          guard post.status == "publish" else {
            return
          }
          try writeMarkdownForPost(post, at: sectionPath)
        }
      }
    }
  }
}
