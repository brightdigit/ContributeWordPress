//
//  WordPressSite.swift
//  ContributeWordPress
//
//  Created by Leo Dion.
//  Copyright © 2026 BrightDigit.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation
import SyndiKit

/// A struct that represents a WordPress site.
public struct WordPressSite: BaseURLSite {
  public static let contentUploadsRelativePath = "wp-content/uploads"

  /// The name of the channel.
  public let title: String

  /// The URL to the HTML website corresponding to the channel.
  public let link: URL

  /// Phrase or sentence describing the channel.
  public let description: String?

  /// The publication date and time of the feed's content.
  public let pubDate: Date?

  /// The categories associated with the site.
  public let categories: [WordPressElements.Category]

  /// The tags associated with the site.
  public let tags: [WordPressElements.Tag]

  /// The URL for site hosting this blog.
  public let baseSiteURL: URL?

  /// The blog URL for this WordPress site.
  public let baseBlogURL: URL?

  /// The posts associated with the site.
  public let posts: [WordPressPost]

  internal let assetURLRegex: NSRegularExpression

  /// Initializes a `WordPressSite` instance.
  ///
  /// - Parameters:
  ///   - title: The name of the channel.
  ///   - link: The URL to the HTML website corresponding to the channel.
  ///   - description: Phrase or sentence describing the channel.
  ///   - pubDate: The publication date and time of the feed's content.
  ///   - categories: The categories associated with the site.
  ///   - tags: The tags associated with the site.
  ///   - baseSiteURL: The base site URL.
  ///   - baseBlogURL: The base blog URL.
  ///   - posts: The posts associated with the site.
  ///   - assetURLRegex: The regular expression for matching asset urls.
  public init(
    title: String,
    link: URL,
    posts: [WordPressPost],
    description: String? = nil,
    pubDate: Date? = nil,
    categories: [WordPressElements.Category] = [],
    tags: [WordPressElements.Tag] = [],
    baseSiteURL: URL? = nil,
    baseBlogURL: URL? = nil,
    assetURLRegex: NSRegularExpression? = nil
  ) {
    self.title = title
    self.link = link
    self.description = description
    self.pubDate = pubDate
    self.categories = categories
    self.tags = tags
    self.baseSiteURL = baseSiteURL
    self.baseBlogURL = baseBlogURL
    self.posts = posts
    // swiftlint:disable:next force_try
    self.assetURLRegex = try! assetURLRegex ?? Self.defaultAssetURLRegex(forAssetSiteURL: link)
  }
}
