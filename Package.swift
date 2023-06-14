// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import PackageDescription

let package = Package(
  name: "BrightDigit",
  platforms: [
    .macOS(.v12)
  ],
  products: [
    .executable(
      name: "brightdigitwg",
      targets: ["brightdigitwg"]
    ),
    .library(name: "Tagscriber", targets: ["Tagscriber"]),
    .library(name: "ContributeMailchimp", targets: ["ContributeMailchimp"]),
    .library(name: "ContributeWordPress", targets: ["ContributeWordPress"]),
    .library(name: "ContributeMedia", targets: ["ContributeMedia"]),
    .library(name: "Contribute", targets: ["Contribute"]),
    .library(name: "PublishType", targets: ["PublishType"])
  ],
  dependencies: [
    .package(url: "https://github.com/johnsundell/Publish.git", from: "0.9.0"),

    .package(url: "https://github.com/johnsundell/SplashPublishPlugin.git", from: "0.2.0"),
    .package(url: "https://github.com/tanabe1478/YoutubePublishPlugin.git", from: "1.0.1"),
    .package(url: "https://github.com/alexito4/ReadingTimePublishPlugin.git", from: "0.3.0"),
    .package(url: "https://github.com/johnsundell/ShellOut.git", from: "2.3.0"),

    .package(url: "https://github.com/BrightDigit/Prch.git", from: "0.2.1"),
    .package(url: "https://github.com/BrightDigit/SwiftTube.git", from: "0.2.0-beta.4"),
    .package(url: "https://github.com/BrightDigit/Spinetail.git", from: "0.3.0"),
    .package(url: "https://github.com/BrightDigit/SyndiKit", from: "0.3.3"),
    .package(url: "https://github.com/BrightDigit/Options.git", from: "0.2.0"),
    .package(url: "https://github.com/brightdigit/NPMPublishPlugin.git", from: "1.0.0"),
    .package(url: "https://github.com/brightdigit/TransistorPublishPlugin.git", from: "1.0.0"),

    .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.4"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.3"),
    .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.2.2"),
    .package(url: "https://github.com/eneko/MarkdownGenerator.git", from: "0.4.0")
  ],
  targets: [
    .executableTarget(
      name: "brightdigitwg",
      dependencies: ["BrightDigitArgs"]
    ),
    .target(name: "Tagscriber", dependencies: ["Kanna", "MarkdownGenerator", "ShellOut"]),
    .target(name: "ContributeMailchimp", dependencies: ["Contribute", "Spinetail"]),
    .target(name: "ContributeWordPress", dependencies: ["Contribute", "SyndiKit"]),
    .target(name: "ContributeMedia", dependencies: ["Contribute", "SyndiKit", "SwiftTube"]),
    .target(name: "Contribute", dependencies: ["Yams", "Prch"]),
    .target(name: "BrightDigitArgs",
            dependencies: [
              .product(name: "ArgumentParser", package: "swift-argument-parser"),
              "BrightDigitSite",
              "ContributeMailchimp",
              "ContributeWordPress",
              "ContributeMedia",
              "Tagscriber"
            ]),
    .target(name: "BrightDigitSite",
            dependencies: [
              "Publish", "SplashPublishPlugin", "YoutubePublishPlugin", "ReadingTimePublishPlugin", "Options", "PublishType", "TransistorPublishPlugin", "NPMPublishPlugin"
            ]),
    .target(name: "PublishType",
            dependencies: [
              "Publish"
            ]),
    .testTarget(
      name: "ContributeTests",
      dependencies: ["Contribute"]
    ),
    .testTarget(
      name: "BrightDigitSiteTests",
      dependencies: ["Yams", "BrightDigitSite"]
    )
  ]
)
