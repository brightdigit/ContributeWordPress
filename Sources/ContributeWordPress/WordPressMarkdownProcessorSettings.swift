import Foundation

public protocol WordPressMarkdownProcessorSettings {
  var contentPathURL: URL { get }
  var resourcesPathURL: URL { get }
  var directoryURL: URL { get }
  var resourceImagePathURL: URL { get }
  var overwriteImages: Bool { get }
  var skipDownload: Bool { get }
  static func markdownFrom(html: String) throws -> String
}
