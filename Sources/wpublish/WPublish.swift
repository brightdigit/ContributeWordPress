//
//  WPublish.swift
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

import ContributeWordPress
import Foundation

/// The `wpublish` command-line entry point.
///
/// Importing is asynchronous, so this is a `@main` type rather than top-level
/// code in `main.swift`: top-level code cannot `await`.
@main
internal enum WPublish {
  internal static func main() async {
    guard CommandLine.arguments.count >= 2 else {
      exit(1)
    }

    let fromURL = URL(fileURLWithPath: CommandLine.arguments[0])
    let toURL = URL(fileURLWithPath: CommandLine.arguments[1])

    // If a third argument is passed, assume they want to copy the resources
    // directly; otherwise use the default `download` option.
    let importAssetsSetting: AssetImportSetting =
      if CommandLine.arguments.count > 2 {
        .copyFilesFrom(URL(fileURLWithPath: CommandLine.arguments[2]))
      } else {
        .download
      }

    do {
      try await MarkdownProcessor.beginImport(
        from: fromURL,
        to: toURL,
        importAssetsBy: importAssetsSetting
      )
    } catch {
      fatalError("WordPress import failed: \(error)")
    }
  }
}
