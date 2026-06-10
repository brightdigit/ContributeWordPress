//
//  AssetImport+WordPress.swift
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

extension AssetImport {
  /// Extracts asset imports from a ``WordPressSite`` using the specified import settings.
  ///
  /// - Parameters:
  ///   - site: The WordPressSite instance.
  ///   - importSettings: The ProcessorSettings instance.
  /// - Returns: An array of AssetImport instances.
  public static func extractAssetImports(
    from site: WordPressSite,
    using importSettings: ProcessorSettings
  ) -> [AssetImport] {
    let assetRoot = ["", importSettings.assetRelativePath, site.importDirectoryName]
      .joined(separator: "/")
    return matchUrls(
      in: site.posts,
      using: site.assetURLRegex
    )
    .compactMap { match in
      AssetImport(
        forPost: match.post,
        sourceURL: match.sourceURL,
        assetRoot: assetRoot,
        resourcesPathURL: importSettings.resourcesPathURL,
        importPathURL: importSettings.assetImportSetting.importPathURL
      )
    }
  }

  private static func matchUrls(
    in posts: [WordPressPost],
    using regex: NSRegularExpression
  ) -> [(sourceURL: URL, post: WordPressPost)] {
    posts
      .flatMap { post in
        regex
          .matches(
            in: post.body,
            range: NSRange(post.body.startIndex..., in: post.body)
          )
          .compactMap { match in
            guard let range = Range(match.range, in: post.body) else {
              return nil
            }

            guard let url = URL(string: String(post.body[range])) else {
              return nil
            }

            return (sourceURL: url, post: post)
          }
      }
  }
}
