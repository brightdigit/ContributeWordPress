import SyndiKit

public struct DynamicRedirectGenerator: RedirectListGenerator {
  internal init(postFilter: @escaping (WordPressPost) -> Bool = Self.defaultFilter(post:), urlPathGenerate: @escaping (String, WordPressPost) -> String = Self.defaultURLPath(fromName:wordpressPost:)) {
    self.postFilter = postFilter
    self.urlPathGenerate = urlPathGenerate
  }

  init(postFilters: [PostFilter]) {
    self.init(postFilter: postFilters.postSatisfiesAll)
  }

  let postFilter: (WordPressPost) -> Bool
  let urlPathGenerate: (String, WordPressPost) -> String

  static func defaultFilter(post: WordPressPost) -> Bool {
    post.type == "post" && post.link.path != "/" && post.status == "publish"
  }

  static func defaultURLPath(fromName name: String, wordpressPost post: WordPressPost) -> String {
    ["", name, post.name].joined(separator: "/")
  }

  public func redirects(fromWordPressPosts allPosts: [String: [WordPressPost]]) -> [RedirectItem] {
    allPosts.flatMap { args -> [RedirectItem] in
      let (dir, posts) = args

      return posts.filter(self.postFilter).map { post in
        RedirectItem(fromURLPath: post.link.path, redirectURLPath: self.urlPathGenerate(dir, post))
      }
    }
  }
}
