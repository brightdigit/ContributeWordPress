import Foundation
import SyndiKit

public struct RegexKeyPostFilter: PostFilter {
  public init(pattern: String, keyPath: KeyPath<WordPressPost, String>, not: Bool = false) throws {
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    self.init(regex: regex, keyPath: keyPath, not: not)
  }

  internal init(regex: NSRegularExpression, keyPath: KeyPath<WordPressPost, String>, not: Bool = false) {
    self.regex = regex
    self.keyPath = keyPath
    self.not = not
  }

  let regex: NSRegularExpression
  let keyPath: KeyPath<WordPressPost, String>
  let not: Bool
  public func include(_ post: WordPressPost) -> Bool {
    let string = post[keyPath: keyPath]
    let range = NSRange(string.startIndex ..< string.endIndex, in: string)
    return (regex.firstMatch(in: string, options: [], range: range) != nil) != not
  }
}
