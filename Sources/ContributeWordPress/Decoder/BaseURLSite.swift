import Foundation
import SyndiKit

/// A protocol representing a site with a base URL.
public protocol BaseURLSite {
  /// The main URL of the site.
  var link: URL { get }

  /// The base URL of the blog, if available.
  var baseBlogURL: URL? { get }
}

extension BaseURLSite {
  /// The base URL of the site.
  public var baseURL: URL {
    baseBlogURL ?? link
  }
}
