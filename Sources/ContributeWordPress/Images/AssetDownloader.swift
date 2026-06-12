//
//  AssetDownloader.swift
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

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that downloads assets required by WordPress posts.
public struct AssetDownloader: Downloader {
  private let urlDownloader: URLDownloader

  /// Initializes a new `AssetDownloader` instance.
  ///
  /// - Parameter urlDownloader: The downloader used to fetch each asset URL.
  public init(
    urlDownloader: URLDownloader = FileURLDownloader()
  ) {
    self.urlDownloader = urlDownloader
  }

  /// Downloads assets using `URLDownloader`.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: A `WordPressError.assetDownloadErrors` error
  ///   if any of the downloads failed.
  public func download(
    assets: [AssetImport],
    allowsOverwrites: Bool
  ) throws {
    try downloadUsingGroupDispatch(
      assets: assets,
      allowsOverwrites: allowsOverwrites
    ) { errors in
      guard errors.isEmpty else {
        throw WordPressError.assetDownloadErrors(errors)
      }
    }
  }

  /// A helper function to download assets using DispatchGroup.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  ///   - completion: A completion handler called with errors mapped to asset source url.
  /// - Throws: Any error thrown by the completion handler.
  private func downloadUsingGroupDispatch(
    assets: [AssetImport],
    allowsOverwrites: Bool,
    completion: (_ errors: [URL: Error]) throws -> Void
  ) throws {
    var errors = [URL: Error]()

    let group = DispatchGroup()

    for asset in assets {
      group.enter()

      urlDownloader.download(
        from: asset.fromURL,
        to: asset.atURL,
        allowOverwrite: allowsOverwrites
      ) { error in
        if let error = error {
          errors[asset.fromURL] = error
        }
        group.leave()
      }
    }

    group.wait()

    try completion(errors)
  }
}
