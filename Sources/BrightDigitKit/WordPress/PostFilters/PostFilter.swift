import Foundation
import SyndiKit

protocol PostFilter {
  func include(_ post: WordPressPost) -> Bool
}
