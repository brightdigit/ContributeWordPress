// swift-tools-version:6.4

import PackageDescription

// swiftlint:disable:next explicit_acl explicit_top_level_acl
let package = Package(
  name: "ContributeWordPress",
  platforms: [
    .macOS(.v15),
    .iOS(.v16),
    .tvOS(.v16),
    .watchOS(.v9),
  ],
  products: [
    .library(
      name: "ContributeWordPress",
      targets: ["ContributeWordPress"]
    ),
    .executable(
      name: "wpublish",
      targets: ["wpublish"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/brightdigit/Contribute.git",
      branch: "main"
    ),
    .package(
      url: "https://github.com/brightdigit/SyndiKit.git",
      branch: "main"
    ),
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
    ),
  ]
)
