import Foundation
import SyndiKit

final class UrlPathGenerateSpy {
  var isCalled: Bool = false

  func generate(sectionName: String, post: WordPressPost) -> String {
    isCalled = true
    return ""
  }
}
