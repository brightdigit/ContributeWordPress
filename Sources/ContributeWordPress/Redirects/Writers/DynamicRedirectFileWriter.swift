//
//  DynamicRedirectFileWriter.swift
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

/// A type that writes redirects from posts into a file.
///
/// It uses an instance of `DynamicRedirectGenerator` to generate redirect items,
/// then using the provided `RedirectFormatter` it formats the redirects into a string
/// whtich later will be written into a file in a given directory.
public struct DynamicRedirectFileWriter: RedirectFileWriter {
  private let generator: RedirectListGenerator
  private let formatter: RedirectFormatter

  public init(
    postFilter: @escaping (WordPressPost) -> Bool,
    urlPathGenerate: @escaping (String, WordPressPost) -> String,
    redirectFromatter: RedirectFormatter
  ) {
    generator = DynamicRedirectGenerator(
      postFilter: postFilter,
      urlPathGenerate: urlPathGenerate
    )
    formatter = redirectFromatter
  }

  public init(
    postFilters: [PostFilter],
    redirectFromatter: RedirectFormatter
  ) {
    generator = DynamicRedirectGenerator(postFilters: postFilters)
    formatter = redirectFromatter
  }

  public init(redirectFromatter: RedirectFormatter) {
    generator = DynamicRedirectGenerator()
    formatter = redirectFromatter
  }

  public func writeRedirects(
    fromSites sites: [SectionName: WordPressSite],
    inDirectory directoryURL: URL
  ) throws {
    let redirects = generator.redirects(fromSites: sites)
    let redirectsText = formatter.formatRedirects(redirects)
    let redirectsPath = formatter.redirectsURL(basedOnResourcesDirectoryURL: directoryURL)
    try redirectsText.write(to: redirectsPath, atomically: true, encoding: .utf8)
  }
}
