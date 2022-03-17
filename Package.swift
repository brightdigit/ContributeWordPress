// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swiftlint:disable explicit_top_level_acl
// swiftlint:disable prefixed_toplevel_constant
// swiftlint:disable explicit_acl

import PackageDescription

let package = Package(
  name: "BrightDigit",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v10),
    .tvOS(.v10),
    .watchOS(.v3)
  ],
  products: [
    .executable(
      name: "brightdigitwg",
      targets: ["brightdigitwg"]
    )
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0"),
    .package(name: "SplashPublishPlugin", url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0"),
    .package(name: "YoutubePublishPlugin", url: "https://github.com/tanabe1478/YoutubePublishPlugin.git", from: "0.1.0"),

    .package(name: "ReadingTimePublishPlugin", url: "https://github.com/alexito4/ReadingTimePublishPlugin", from: "0.2.0"),

    .package(url: "https://github.com/BrightDigit/SwiftTube.git", from: "0.2.0-beta.1"),
    .package(url: "https://github.com/BrightDigit/Spinetail.git", from: "0.2.0-beta.1"),
    .package(url: "https://github.com/BrightDigit/SyndiKit", from: "0.2.0"),
    .package(url: "https://github.com/BrightDigit/Options.git", from: "0.2.0"),

    .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.4"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
    .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.2.2"),
    .package(url: "https://github.com/eneko/MarkdownGenerator.git", from: "0.4.0"),

    .package(url: "https://github.com/shibapm/Komondor", from: "1.1.2"), // dev
    .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.47.0"), // dev
    .package(url: "https://github.com/realm/SwiftLint", from: "0.43.0") // dev
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "brightdigitwg",
      dependencies: ["BrightDigitKit"]
    ),
    .target(name: "BrightDigitKit",
            dependencies: ["SyndiKit", "Publish",
                           "SplashPublishPlugin", "YoutubePublishPlugin", "Kanna", "MarkdownGenerator", "Yams",
                           "ReadingTimePublishPlugin",
                           "SwiftTube", "Spinetail", "Options",
                           .product(name: "ArgumentParser", package: "swift-argument-parser")]),
    .testTarget(
      name: "brightdigitwgTests",
      dependencies: ["brightdigitwg"]
    )
  ]
)

#if canImport(PackageConfig)
  import PackageConfig
  let config = PackageConfiguration([
    "komondor": [
      "pre-commit": [
        "swift test --enable-code-coverage --enable-test-discovery --generate-linuxmain",
        "swift run swiftformat .",
        "swift run swiftlint autocorrect",
        "git add .",
        "swift run swiftformat --lint .",
        "swift run swiftlint"
      ]
    ]
  ]).write()
#endif
