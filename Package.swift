// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import PackageDescription

let package = Package(
  name: "ContributeWordpress",
  platforms: [.macOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "ContributeWordpress",
      targets: ["ContributeWordpress"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/brightdigit/Contribute.git",
      branch: "shendy/develop/migration"
    ),
    .package(
      url: "https://github.com/brightdigit/SyndiKit.git",
      from: "0.3.0"
    )
  ],
  targets: [
    .target(
      name: "ContributeWordpress",
      dependencies: ["Contribute", "SyndiKit"]
    ),
    .testTarget(
      name: "ContributeWordpressTests",
      dependencies: ["ContributeWordpress"]
    )
  ]
)
