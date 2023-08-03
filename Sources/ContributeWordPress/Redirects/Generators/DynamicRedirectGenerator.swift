import SyndiKit

/// A type that provides dynamic implementation for generating redirects.
///
/// It allows for flexible and customizable generation of redirects by providing closures
/// for post filtering and URL path generation.
///
/// It dynamically determines which WordPress posts should be included in the redirects
/// and generates the redirect URL paths based on the provided criteria.
///
/// By using the `DynamicRedirectGenerator`, someone can define their own rules
/// and logic for including or excluding specific WordPress posts and generating the
/// corresponding redirect URL paths. This flexibility enables dynamic decision-making and
/// customization of the redirect generation process.
///
public struct DynamicRedirectGenerator: RedirectListGenerator {
  private let postFilter: (WordPressPost) -> Bool
  private let urlPathGenerate: (String, WordPressPost) -> String

  /// Initializes a new `DynamicRedirectGenerator` instance.
  ///
  /// - Parameters:
  ///   - postFilter: A closure that determines whether a WordPress post
  ///                 should be included in the redirects.
  ///   - urlPathGenerate: A closure that generates the redirect URL path
  ///                      for a WordPress post.
  public init(
    postFilter: @escaping (WordPressPost) -> Bool = Self.defaultFilter(post:),
    urlPathGenerate: @escaping (String, WordPressPost) -> String = Self.defaultURLPath(
      fromName:wordpressPost:
    )
  ) {
    self.postFilter = postFilter
    self.urlPathGenerate = urlPathGenerate
  }

  /// Initializes a new `DynamicRedirectGenerator` instance with custom post filters.
  ///
  /// - Parameter postFilters: An array of post filters to apply.
  public init(postFilters: [PostFilter]) {
    self.init(postFilter: postFilters.postSatisfiesAll)
  }

  /// Generates redirects for each post from the given WordPress sites.
  ///
  /// - Parameter allPosts: A dictionary of WordPress posts keyed by section name.
  /// - Returns: An array of `RedirectItem` representing the redirects.
  public func redirects(
    fromSites sites: [SectionName: WordPressSite]
  ) -> [RedirectItem] {
    sites.flatMap { dir, site -> [RedirectItem] in
      site.posts
        .filter(self.postFilter)
        .map { post in
          RedirectItem(
            fromURLPath: post.link.path,
            redirectURLPath: self.urlPathGenerate(dir, post)
          )
        }
    }
  }
}

extension DynamicRedirectGenerator {
  /// The default filter used by `DynamicRedirectGenerator`.
  ///
  /// - Parameter post: The WordPress post being evaluated.
  /// - Returns: A boolean value indicating whether the post should be included
  ///            in the redirects.
  public static func defaultFilter(post: WordPressPost) -> Bool {
    post.type == "post" && post.link.path != "/" && post.status == "publish"
  }

  /// The default URL redirect path generator used by `DynamicRedirectGenerator`.
  ///
  /// - Parameters:
  ///   - name: The name of the directory where the WordPress posts are located.
  ///   - post: The WordPress post for which the redirect URL path is generated.
  /// - Returns: The redirect URL path for the WordPress post.
  public static func defaultURLPath(
    fromName name: String,
    wordpressPost post: WordPressPost
  ) -> String {
    ["", name, post.name].joined(separator: "/")
  }
}
