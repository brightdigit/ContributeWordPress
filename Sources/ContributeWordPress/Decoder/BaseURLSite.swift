import Foundation
import SyndiKit

protocol BaseURLSite {
  var link: URL { get }
  var baseBlogURL: URL? { get }
}

extension BaseURLSite {
  public var baseURL: URL {
    baseBlogURL ?? link
  }
}

extension RSSChannel: BaseURLSite {
  var baseBlogURL: URL? {
    wpBaseBlogURL
  }
}
