//
//  MarkdownProcessor+SectionContentURLGenerator.swift
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

extension MarkdownProcessor {
  /// Initializes a new `WordPressMarkdownProcessor` instance.
  ///
  /// It will be created with a `DynamicRedirectFileWriter` instance that makes use of
  /// `DynamicRedirectGenerator` and the provided `RedirectFormatter` to generate
  /// the redirects and write them into a file.
  ///
  /// - Parameters:
  ///   - contentBuilder: The content builder.
  ///   - destinationURLGenerator: The destination URL generator.
  ///   - exportDecoder: The decoder used to decode posts.
  ///   - postFilters: The post filters.
  ///   - redirectFromatter: The formatter used to make redirects.
  ///   - assetDownloader: The asset downloader.
  ///   - assetImportFactory: The asset import factory.
  public init(
    contentBuilder: ContentBuilderType = .init(
      frontMatterExporter: .init(translator: SpecFrontMatterTranslator()),
      markdownExtractor: FilteredHTMLMarkdownExtractor<Source>()
    ),
    destinationURLGenerator: URLGeneratorType = .init(),
    exportDecoder: SitesExportDecoder = SitesExportSynDecoder(),
    postFilters: [PostFilter] = .default,
    redirectFromatter: RedirectFormatter? = nil,
    assetDownloader: Downloader = AssetDownloader(),
    assetImportFactory: @escaping AssetImportFactory =
      AssetImport.extractAssetImports(from:using:)
  )
  where
    URLGeneratorType == SectionContentURLGenerator,
    ContentBuilderType == MarkdownContentYAMLBuilder<
      Source,
      FilteredHTMLMarkdownExtractor<Source>,
      FrontMatterYAMLExporter<Source, SpecFrontMatterTranslator>
    >
  {
    self.init(
      contentBuilder: contentBuilder,
      destinationURLGenerator: destinationURLGenerator,
      exportDecoder: exportDecoder,
      postFilters: postFilters,
      redirectWriter: redirectFromatter.map(
        DynamicRedirectFileWriter.init(redirectFromatter:)
      ),
      assetDownloader: assetDownloader,
      assetImportFactory: assetImportFactory
    )
  }
}
