//
//  MarkdownProcessor+Starter.swift
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

extension MarkdownProcessor
where
  URLGeneratorType == SectionContentURLGenerator,
  ContentBuilderType == MarkdownContentYAMLBuilder<
    Source,
    FilteredHTMLMarkdownExtractor<Source>,
    FrontMatterYAMLExporter<Source, SpecFrontMatterTranslator>
  >
{
  /// Begins the processing of the WordPress posts.
  /// - Parameters:
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - rootPublishSiteURL: Root Directory of the Publish site.
  ///   - postFilters: The post filters.
  ///   - redirectFromatter: Formats the given redirects of old URLs.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - markdownGenerator: Converts the given HTML string to Markdown string.
  /// - Throws: An error if the WordPress posts could not be imported.
  public static func beginImport(
    from exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    filteringPostsWith postFilters: [PostFilter] = .default,
    redirectsFormattedUsing redirectFromatter: RedirectFormatter? = nil,
    importAssetsBy assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    usingGenerator markdownGenerator: MarkdownGenerator =
      PassthroughMarkdownGenerator.shared
  ) throws {
    let settings = Settings(
      rootPublishSiteURL: rootPublishSiteURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      markdownGenerator: markdownGenerator
    )
    let processor = MarkdownProcessor(
      postFilters: postFilters,
      redirectFromatter: redirectFromatter
    )
    try processor.begin(withSettings: settings)
  }

  /// Begins the processing of the WordPress posts.
  /// - Parameters:
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - rootPublishSiteURL: Root Directory of the Publish site.
  ///   - postFilters: The post filters.
  ///   - redirectFromatter: Formats the given redirects of old URLs.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - shellOut: Runs a `pandoc` command
  ///   for converting HTML to Markdown using `ShellOut`
  /// - Throws: An error if the WordPress posts could not be imported.
  public static func beginImport(
    from exportsDirectoryURL: URL,
    to rootPublishSiteURL: URL,
    filteringPostsWith postFilters: [PostFilter] = .default,
    redirectsFormattedUsing redirectFromatter: RedirectFormatter? = nil,
    importAssetsBy assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    shellOut: @escaping @Sendable (String, [String]) throws -> String
  ) throws {
    try beginImport(
      from: exportsDirectoryURL,
      to: rootPublishSiteURL,
      filteringPostsWith: postFilters,
      redirectsFormattedUsing: redirectFromatter,
      importAssetsBy: assetImportSetting,
      overwriteAssets: overwriteAssets,
      usingGenerator: PandocMarkdownGenerator(shellOut: shellOut)
    )
  }
}
