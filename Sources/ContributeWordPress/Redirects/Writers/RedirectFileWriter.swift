import Foundation
import SyndiKit

public protocol RedirectFileWriter {
  func writeRedirects(
    fromPosts posts: [SectionName: [WordPressPost]],
    inDirectory directoryURL: URL
  ) throws
}
