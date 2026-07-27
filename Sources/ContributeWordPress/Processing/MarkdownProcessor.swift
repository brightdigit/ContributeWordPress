//
//  MarkdownProcessor.swift
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
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that processes WordPress sites and generates Markdowns for their posts.
public struct MarkdownProcessor<
  URLGeneratorType: ContentURLGenerator,
  ContentBuilderType: MarkdownContentBuilder
>
where
  URLGeneratorType.SourceType == Source,
  ContentBuilderType.SourceType == Source
{
  internal let exportDecoder: SitesExportDecoder
  internal let assetDownloader: Downloader
  internal let redirectWriter: RedirectFileWriter?
  internal let assetImportFactory: AssetImportFactory
  private let destinationURLGenerator: URLGeneratorType
  private let contentBuilder: ContentBuilderType
  private let postFilters: [PostFilter]

  /// Initializes a new `MarkdownProcessor` instance.
  ///
  /// - Parameters:
  ///   - contentBuilder: The Markdown content builder.
  ///   - destinationURLGenerator: The content URL generator.
  ///   - exportDecoder: The export decoder.
  ///   - postFilters: The post filters.
  ///   - redirectWriter: Optional redirect file writer.
  ///   - assetDownloader: The asset downloader.
  ///   - assetImportFactory: The asset import factory.
  public init(
    contentBuilder: ContentBuilderType,
    destinationURLGenerator: URLGeneratorType,
    exportDecoder: SitesExportDecoder = SitesExportSynDecoder(),
    postFilters: [PostFilter] = .default,
    redirectWriter: RedirectFileWriter? = nil,
    assetDownloader: Downloader = AssetDownloader(),
    assetImportFactory: @escaping AssetImportFactory =
      AssetImport.extractAssetImports(from:using:)
  ) {
    self.exportDecoder = exportDecoder
    self.redirectWriter = redirectWriter
    self.assetDownloader = assetDownloader
    self.destinationURLGenerator = destinationURLGenerator
    self.contentBuilder = contentBuilder
    self.postFilters = postFilters
    self.assetImportFactory = assetImportFactory
  }

  internal func writeAllPosts(
    fromSites sites: [SectionName: WordPressSite],
    withAssets assets: [AssetImport],
    withSettings settings: ProcessorSettings
  ) throws {
    try writeAllPosts(
      fromSites: sites,
      withAssets: assets,
      inContentDirectory: settings.contentPathURL,
      using: settings.markdownFrom(html:),
      htmlFromSitePost: settings.htmlFromPost
    )
  }

  private func writeSite(
    _ site: WordPressSite,
    sectionName: String,
    importing assets: [AssetImport],
    to contentDirectoryURL: URL,
    transformFromHTML: @escaping (String) throws -> String,
    transformerFromSite: ((WordPressSite) -> ((WordPressPost) -> String))? = nil
  ) throws {
    try FileManager.createDirectory(withName: sectionName, in: contentDirectoryURL)
    let htmlFromPost = transformerFromSite?(site)
    let posts = site.posts
      .filter(postFilters.postSatisfiesAll)
      .map { post in (post, assets.first { $0.parentID == post.id }) }
    for (post, featuredImage) in posts {
      _ = try self.contentBuilder.write(
        from: .init(
          sectionName: sectionName,
          post: post,
          featuredImage: featuredImage.map(\.featuredPath),
          htmlFromPost: htmlFromPost
        ),
        atContentPathURL: contentDirectoryURL,
        basedOn: self.destinationURLGenerator,
        using: transformFromHTML
      )
    }
  }

  private func writeAllPosts(
    fromSites sites: [SectionName: WordPressSite],
    withAssets assets: [AssetImport],
    inContentDirectory contentDirectoryURL: URL,
    using htmlToMarkdown: @escaping (String) throws -> String,
    htmlFromSitePost: ((WordPressSite) -> ((WordPressPost) -> String))? = nil
  ) throws {
    for (sectionName, site) in sites {
      try writeSite(
        site,
        sectionName: sectionName,
        importing: assets,
        to: contentDirectoryURL,
        transformFromHTML: htmlToMarkdown,
        transformerFromSite: htmlFromSitePost
      )
    }
  }
}
