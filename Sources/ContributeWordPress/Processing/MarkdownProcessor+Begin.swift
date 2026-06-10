//
//  MarkdownProcessor+Begin.swift
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
extension MarkdownProcessor {
  /// Begins the processing of the WordPress posts.
  ///
  /// - Parameter settings: The required settings for processing WordPress exports.
  /// - Throws: An error if the processing failed at any step.
  public func begin(
    withSettings settings: ProcessorSettings
  ) throws {
    // 1. Decodes WordPress site from exports directory.
    let allSites = try exportDecoder.sites(fromExportsAt: settings.exportsDirectoryURL)

    // 2. Writes redirects for all decoded WordPress posts.
    try redirectWriter?.writeRedirects(
      fromSites: allSites,
      inDirectory: settings.resourcesPathURL
    )

    // 3. Extract and download asset imports for all WordPress sites.
    let assetImports: [AssetImport] = allSites.values.flatMap {
      assetImportFactory($0, settings)
    }

    if settings.assetImportSetting != .none {
      try assetDownloader.download(
        assets: assetImports,
        allowsOverwrites: settings.overwriteAssets
      )
    }

    // 4. Starts writing the markdown files for all WordPress posts for each site.
    try writeAllPosts(
      fromSites: allSites,
      withAssets: assetImports,
      withSettings: settings
    )
  }
}
