//
//  AssetDownloadErrors.swift
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

/// A thread-safe accumulator for the errors produced by concurrent asset downloads.
///
/// ``AssetDownloader`` fans its downloads out over a `DispatchGroup` and each
/// download reports back on whatever queue its `URLDownloader` uses — for
/// `FileURLDownloader` that is `URLSession`'s delegate queue, which delivers
/// several completions concurrently. Collecting the failures therefore has to be
/// synchronized, which is what this type does.
///
/// `Synchronization.Mutex` would express that in the type system, but it needs
/// macOS 15 / iOS 18 and this package supports iOS 16 / watchOS 9, so the lock is
/// external and `storage` is marked `nonisolated(unsafe)`: it is only ever touched
/// through ``all``/``record(_:for:)``, which hold `lock` for the whole access.
internal final class AssetDownloadErrors: Sendable {
  /// Every error recorded so far, keyed by the source URL of the asset that failed.
  internal var all: [URL: Error] {
    self.lock.lock()
    defer { self.lock.unlock() }
    return self.storage
  }

  private let lock = NSLock()
  nonisolated(unsafe) private var storage = [URL: Error]()

  /// Records the error a download reported for an asset.
  ///
  /// - Parameters:
  ///   - error: The error the download failed with.
  ///   - url: The source URL of the asset that failed to download.
  internal func record(_ error: Error, for url: URL) {
    self.lock.lock()
    defer { self.lock.unlock() }
    self.storage[url] = error
  }
}
