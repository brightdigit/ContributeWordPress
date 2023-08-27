import Foundation
import SyndiKit

internal final class PostFilterSpy {
  internal var isCalled: Bool = false

  internal func include(_: WordPressPost) -> Bool {
    isCalled = true
    return true
  }
}
