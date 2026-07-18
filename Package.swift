// swift-tools-version:6.4
// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import PackageDescription

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
    .package(name: "Contribute", path: "../../BrightDigit/Contribute"),
    .package(name: "SyndiKit", path: "../../BrightDigit/SyndiKit"),
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
