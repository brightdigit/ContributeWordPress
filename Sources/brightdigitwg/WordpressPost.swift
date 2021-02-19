import Foundation
import Kanna

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
