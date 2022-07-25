import Foundation

public protocol MarkdownGenerator {
  func markdown(fromHTML htmlString: String) throws -> String
}
