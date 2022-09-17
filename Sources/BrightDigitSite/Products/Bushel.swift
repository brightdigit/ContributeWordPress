import Foundation

extension Product {
  static let bushel: Product =
    .init(title: "Bushel", description: """
     ### Create Unbreakable macOS Apps

     Bushel is the macOS virtual machine app for developers who want to be rigorous and uncompromising in their app testing. Bushel is focused on giving you the complete, native capabilities of the operating system for all your testing requirements.
    """, style: .default, screenshots: [
      .at(path: "macOS/bushel.image.library.webp"),
      .at(path: "macOS/bushel.welcome.webp"),
      .at(path: "macOS/macOS.monterey.hallo.webp"),
      .at(path: "macOS/macOS.monterey.sharing.prefs.webp")
    ], platforms: [.macOS], technologies: [.swiftUI, .virtualization], productURL: "https://getbushel.app")
}
