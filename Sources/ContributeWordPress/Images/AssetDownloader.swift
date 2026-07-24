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
  /// Every asset is downloaded concurrently in a task group. Each child task
  /// returns its own failure rather than writing to shared state, so the errors
  /// are collected at the join point without any synchronization.
  ///
  /// - Parameters:
  ///   - assets: The imported assets to be downloaded.
  ///   - allowsOverwrites: To allow overwriting existing assets.
  /// - Throws: A `WordPressError.assetDownloadErrors` error
  ///   if any of the downloads failed.
  public func download(
    assets: [AssetImport],
    allowsOverwrites: Bool
  ) async throws {
    let errors = try await withThrowingTaskGroup(
      of: (URL, any Error)?.self
    ) { group in
      for asset in assets {
        group.addTask {
          do {
            try await urlDownloader.download(
              from: asset.fromURL,
              to: asset.atURL,
              allowOverwrite: allowsOverwrites
            )
            return nil
          } catch {
            return (asset.fromURL, error)
          }
        }
      }

      var errors = [URL: any Error]()
      for try await case (let url, let error)? in group {
        errors[url] = error
      }
      return errors
    }

    guard errors.isEmpty else {
      throw WordPressError.assetDownloadErrors(errors)
    }
  }
}
