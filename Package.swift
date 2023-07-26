// swift-tools-version: 5.8
// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import PackageDescription

let package = Package(
  name: "ContributeWordPress",
  platforms: [.macOS(.v13)],
  products: [
    .library(
      name: "ContributeWordPress",
      targets: ["ContributeWordPress"]
    )
  ],
  dependencies: [
    .package(
      name: "Contribute",
      path: "../Contribute"
    ),
    .package(
      name: "SyndiKit",
      path: "../SyndiKit"
    )
  ],
  targets: [
    .target(
      name: "ContributeWordPress",
      dependencies: ["Contribute", "SyndiKit"]
    ),
    .testTarget(
      name: "ContributeWordPressTests",
      dependencies: ["ContributeWordPress"]
    )
  ]
)
