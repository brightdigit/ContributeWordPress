// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import ContributeWordPress
import Foundation

let fromURL: URL
let toURL: URL

let importAssetsSetting: AssetImportSetting

guard CommandLine.arguments.count >= 2 else {
  exit(1)
}

fromURL = URL(fileURLWithPath: CommandLine.arguments[0])
toURL = URL(fileURLWithPath: CommandLine.arguments[1])

// if a third argument is passed
if CommandLine.arguments.count > 2 {
  // assume they want to copy the resources directly
  importAssetsSetting = .copyFilesFrom(
    URL(fileURLWithPath: CommandLine.arguments[2])
  )
} else {
  // otherwise use the default `download` option
  importAssetsSetting = .download
}

// swiftlint:disable:next force_try
try! MarkdownProcessor.beginImport(
  from: fromURL,
  to: toURL,
  filteringPostsWith: <#T##[PostFilter]#>,
  importAssetsBy: importAssetsSetting
)
