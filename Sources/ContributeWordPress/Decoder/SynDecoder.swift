//
//  SynDecoder.swift
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

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// An extension that enables SynDecoder to decode WordPress sites.
extension SynDecoder: WordPressDecoder {
  /// Decodes an array of WordPress sites from the given data.
  ///
  /// - Parameters:
  ///   - data: The data to decode.
  ///   - allowInvalidCharacters: Whether to allow invalid characters in the data.
  /// - Returns: The decoded WordPress site, or nil if decoding failed.
  /// - Throws: An error if data couldn't be decoded.
  public func decodeSites(
    fromData data: Data,
    allowInvalidCharacters: Bool
  ) throws -> WordPressSite? {
    let text = String(bytes: data, encoding: .utf8)?
      .replacingOccurrences(of: "\u{10}", with: "")
      .data(using: .utf8, allowLossyConversion: true)

    let newData: Data
    if let text = text, allowInvalidCharacters {
      newData = text
    } else {
      newData = data
    }

    let feed = try decode(newData)
    let rss = feed as? RSSFeed
    return try rss.map(\.channel).map(WordPressSite.init)
  }
}
