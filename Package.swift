// swift-tools-version: 5.8
// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import PackageDescription

let package = Package(
  name: "ContributeWordPress",
  platforms: [.macOS(.v12)],
  products: [
    .library(
      name: "ContributeWordPress",
      targets: ["ContributeWordPress"]
    ),
    .executable(
      name: "wpublish",
      targets: ["wpublish"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/brightdigit/Contribute.git",
      branch: "1.0.0-alpha.4"
    ),
    .package(
      url: "https://github.com/brightdigit/SyndiKit.git",
      from: "0.3.4"
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
    ),
    .executableTarget(
      name: "wpublish",
      dependencies: ["ContributeWordPress"]
    )
  ]
)
