//
//  SpecFrontMatterTranslator.swift
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

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that converts front matter from a WordPress source to a `Specs` object.
public struct SpecFrontMatterTranslator: FrontMatterTranslator {
  /// The WordPress source type the front matter is translated from.
  public typealias SourceType = Source

  /// The front matter type the source is translated to.
  public typealias FrontMatterType = Specs

  /// Initialize a new instance of `SpecFrontMatterTranslator`.
  public init() {}

  /// Convert front matter from a WordPress source to a `Specs` object.
  ///
  /// - Parameter source: The WordPress source.
  /// - Returns: The converted from matter as `Specs` object .
  public func frontMatter(from source: Source) -> Specs {
    Specs(from: source)
  }
}
