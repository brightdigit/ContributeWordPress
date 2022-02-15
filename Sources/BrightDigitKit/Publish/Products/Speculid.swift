import Foundation

extension Product {
  static let speculid: Product =
    .init(title: "Speculid", description: """
     Quickly create icons and images for your app’s interface

     Speculid links a single graphic file to an Image Set or App Icon and automatically renders different resolutions, file types, and sizes for all your image needs.

     You no longer need to go through the tedious process of exporting each one of your images in all the formats and resolutions needed.

     With Speculid, you can:

     * Format multiple input file types, including .svg vector files and raster .png files
     * Automatically create each necessary resized raster file
     * Remove transparencies from app icon file
     * Export to .pdf and .png for vector images in image sets
    """, screenshots: [
      .at(path: "screenshots/Animation.gif"),
      .at(path: "screenshots/Mac.png"),
      .at(path: "screenshots/Xcode.png")
    ], platforms: [.macOS], technologies: [.swiftUI], productURL: "https://speculid.com/")
}
