//
//  Source.swift
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

import Contribute
import Foundation
import SyndiKit

/// A type that represents a source for a WordPress post.
public struct Source {
  /// The name of the section to which the post belongs.
  public let sectionName: String

  /// The WordPress object containing the contents of the post.
  public let post: WordPressPost

  /// Optional URL string pointing to the featured image of the post.
  public let featuredImage: String?

  /// Optional closure to get html string from the post.
  public var htmlFromPost: ((WordPressPost) -> String)?

  /// Initializes a new `Source` instance.
  public init(
    sectionName: String,
    post: WordPressPost,
    featuredImage: String?,
    htmlFromPost: ((WordPressPost) -> String)? = nil
  ) {
    self.sectionName = sectionName
    self.post = post
    self.featuredImage = featuredImage
    self.htmlFromPost = htmlFromPost
  }
}

extension Source: HTMLSource {
  /// The HTML body of the WordPress post.
  public var html: String {
    htmlFromPost?(post) ?? post.body
  }
}
