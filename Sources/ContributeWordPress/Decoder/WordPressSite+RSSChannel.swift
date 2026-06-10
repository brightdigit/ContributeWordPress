//
//  WordPressSite+RSSChannel.swift
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

extension WordPressSite {
  /// Returns the import directory name.
  public var importDirectoryName: String {
    baseURL.firstHostComponent ?? baseSiteURL?.firstHostComponent ?? "default"
  }

  /// Initializes a `WordPressSite` instance from an ``SyndiKit/RSSChannel``.
  ///
  /// - Parameters:
  ///   - channel: The `RSSChannel` instance.
  /// - Throws: An error if initialization fails.
  public init(channel: RSSChannel) throws {
    try self.init(
      channel: channel,
      relativeResourcePath: WordPressSite.contentUploadsRelativePath
    )
  }

  /// Initializes a `WordPressSite` instance from an `SyndiKit/RSSChannel`` with
  /// a relative resource path.
  ///
  /// - Parameters:
  ///   - channel: The RSSChannel instance.
  ///   - relativeResourcePath: The relative resource path.
  /// - Throws: An error if initialization fails.
  public init(
    channel: RSSChannel,
    relativeResourcePath: String
  ) throws {
    let assetURLRegex = try Self.defaultAssetURLRegex(
      forSite: channel,
      relativeResourcePath: relativeResourcePath
    )
    self.init(
      title: channel.title,
      link: channel.link,
      posts: channel.items.compactMap(\.wpPost),
      categories: channel.wpCategories,
      tags: channel.wpTags,
      baseSiteURL: channel.wpBaseSiteURL,
      baseBlogURL: channel.wpBaseBlogURL,
      assetURLRegex: assetURLRegex
    )
  }

  /// Returns the default regular expression for matching asset urls.
  ///
  /// - Parameters:
  ///   - site: The `BaseURLSite` instance.
  ///   - relativeResourcePath: The relative resource path where assets would be located.
  /// - Returns: The default regular expression for matching asset urls.
  /// - Throws: An error if the regular expression cannot be created.
  internal static func defaultAssetURLRegex(
    forSite site: BaseURLSite,
    relativeResourcePath: String = WordPressSite.contentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try Self.defaultAssetURLRegex(
      forAssetSiteURL: site.baseURL,
      relativeResourcePath: relativeResourcePath
    )
  }

  /// Returns the default regular expression for matching asset url.
  ///
  /// - Parameters:
  ///   - assetSiteURL: The asset site URL.
  ///   - relativeResourcePath: The relative resource path.
  /// - Returns: The default regular expression for matching asset url.
  /// - Throws: An error if the regular expression cannot be created.
  public static func defaultAssetURLRegex(
    forAssetSiteURL assetSiteURL: URL,
    relativeResourcePath: String = WordPressSite.contentUploadsRelativePath
  ) throws -> NSRegularExpression {
    try NSRegularExpression(pattern: "\(assetSiteURL)/\(relativeResourcePath)([^\"]+)")
  }
}
