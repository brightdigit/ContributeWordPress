import Foundation
import SyndiKit

final class PostFilterSpy {
  var isCalled: Bool = false

  func include(_ post: WordPressPost) -> Bool {
    isCalled = true
    return true
  }
}
