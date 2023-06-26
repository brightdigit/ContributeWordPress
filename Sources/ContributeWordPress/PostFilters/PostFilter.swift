import Foundation
import SyndiKit

public protocol PostFilter {
  func include(_ post: WordPressPost) -> Bool
}
