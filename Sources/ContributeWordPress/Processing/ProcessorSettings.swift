//
//  ProcessorSettings.swift
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

/// A protocol that defines the settings for the ``MarkdownProcessor``.
public protocol ProcessorSettings {
  /// The URL for the content path
  ///
  /// Example: /..../Content/
  var contentPathURL: URL { get }

  /// The URL for the resources path
  ///
  /// Example: /..../Resources/
  var resourcesPathURL: URL { get }

  /// The URL for the directory containing the export files.
  ///
  /// Example: /..../WordPress/exports/
  var exportsDirectoryURL: URL { get }

  /// Whether to overwrite existing assets.
  var overwriteAssets: Bool { get }

  /// The method to import assets from the WordPress site.
  var assetImportSetting: AssetImportSetting { get }

  /// Name of directory to store assets relative to ``resourcesPathURL``
  var assetRelativePath: String { get }

  /// The relative path for uploads.
  var uploadsRelativePath: String { get }

  /// Converts the given HTML string to Markdown string.
  ///
  /// - Parameter html: The HTML string to convert.
  /// - Returns: The Markdown string representation of the HTML.
  /// - Throws: An error if the HTML could not be converted to Markdown.
  func markdownFrom(html: String) throws -> String

  /// Converts the given `WordPressSite` to HTML string.
  ///
  /// - Parameter site: The WordPress site to convert.
  /// - Returns: The HTML string representation of the WordPress site.
  func htmlFromPost(_ site: WordPressSite) -> ((WordPressPost) -> String)
}

extension ProcessorSettings {
  /// The URL for the asset path located under `resourcesPathURL`.
  public var resourceAssetPathURL: URL {
    resourcesPathURL.appendingPathComponent(assetRelativePath)
  }

  /// The relative path for uploads directory of WordPress content.
  public var uploadsRelativePath: String {
    WordPressSite.contentUploadsRelativePath
  }

  /// Returns the asset directory path for the given site name.
  ///
  /// - Parameter siteName: The name of the site.
  /// - Returns: The asset directory path.
  public func assetDirectoryPath(forSiteName siteName: String) -> String {
    let assetRelative =
      resourceAssetPathURL.relativePath(
        from: resourcesPathURL
      ) ?? resourcesPathURL.path

    return ["", assetRelative, siteName].joined(separator: "/")
  }

  /// Returns the HTML from the given post.
  ///
  /// - Parameter site: The WordPress site.
  /// - Returns: The HTML representation of the post.
  public func htmlFromPost(_ site: WordPressSite) -> ((WordPressPost) -> String) {
    let assetPostURLSearchPrefix = site
      .baseURL
      .appendingPathComponent(uploadsRelativePath)
      .absoluteString
    return { post in
      post.body.replacingOccurrences(
        of: assetPostURLSearchPrefix,
        with: self.assetDirectoryPath(forSiteName: site.importDirectoryName)
      )
    }
  }
}
