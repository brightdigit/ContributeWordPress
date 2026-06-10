//
//  NetlifyRedirectFormatter.swift
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

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that formats redirects in the way Netlify can understand it.
public struct NetlifyRedirectFormatter: RedirectFormatter {
  public init() {}

  /// Formats the given redirect items into a string representation.
  ///
  /// - Parameter redirects: An array of `RedirectItem` representing the redirects.
  /// - Returns: A string representation of the formatted redirects.
  public func formatRedirects(_ redirects: [RedirectItem]) -> String {
    redirects
      .map { [$0.fromURLPath, $0.redirectURLPath].joined(separator: "\t") }
      .joined(separator: "\n")
  }

  /// Returns the URL where the redirect file should be written based on
  /// the resources directory URL.
  ///
  /// - Parameter resourcesDirURL: The resources directory URL.
  /// - Returns: The URL where the redirect file should be written.
  public func redirectsURL(basedOnResourcesDirectoryURL resourcesDirURL: URL) -> URL {
    resourcesDirURL.appendingPathComponent("_redirects")
  }
}
