//
//  Settings+Root.swift
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

extension Settings {
  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath: Directory name for assets within ``resourcesPathURL``.
  ///   - markdownGenerator: Converts the given HTML string to Markdown string.
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownGenerator: MarkdownGenerator = PassthroughMarkdownGenerator.shared
  ) {
    self.init(
      contentPathURL:
        rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName),
      resourcesPathURL:
        rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName),
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownGenerator: markdownGenerator
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath: Directory name for assets within ``resourcesPathURL``.
  ///   - markdownFromHTML: Converts the given HTML string to Markdown string.
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath,
    markdownFromHTML: @escaping (String) throws -> String
  ) {
    self.init(
      contentPathURL:
        rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName),
      resourcesPathURL:
        rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName),
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: markdownFromHTML
    )
  }

  /// Defines the settings for the ``MarkdownProcessor``
  /// - Parameters:
  ///   - rootPublishSiteURL: Root of the `Publish` site.
  ///   - exportsDirectoryURL: The URL for the directory containing the export files.
  ///   - assetImportSetting: The method to import assets from the WordPress site.
  ///   - overwriteAssets: Whether to overwrite existing assets.
  ///   - assetRelativePath: Directory name for assets within ``resourcesPathURL``.
  public init(
    rootPublishSiteURL: URL,
    exportsDirectoryURL: URL,
    assetImportSetting: AssetImportSetting = .download,
    overwriteAssets: Bool = false,
    assetRelativePath: String = PublishDefaults.wpAssetsRelativePath
  ) {
    self.init(
      rootPublishSiteURL: rootPublishSiteURL,
      exportsDirectoryURL: exportsDirectoryURL,
      assetImportSetting: assetImportSetting,
      overwriteAssets: overwriteAssets,
      assetRelativePath: assetRelativePath,
      markdownFromHTML: PassthroughMarkdownGenerator.shared.markdown(fromHTML:)
    )
  }
}
