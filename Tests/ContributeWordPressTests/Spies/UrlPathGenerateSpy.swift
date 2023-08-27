import Foundation
import SyndiKit

internal final class UrlPathGenerateSpy {
  internal var isCalled: Bool = false

  internal func generate(sectionName _: String, post _: WordPressPost) -> String {
    isCalled = true
    return ""
  }
}
