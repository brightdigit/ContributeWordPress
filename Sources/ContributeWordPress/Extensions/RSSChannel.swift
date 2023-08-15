import Foundation
import SyndiKit

extension RSSChannel: BaseURLSite {
  public var baseBlogURL: URL? {
    wpBaseBlogURL
  }
}
