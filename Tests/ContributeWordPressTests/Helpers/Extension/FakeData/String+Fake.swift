import Foundation

extension String {
  private static let dataDirectoryURL = { filePath in
    let thisFileURL = URL(fileURLWithPath: filePath)
    var dataDirectoryURL = thisFileURL
    for _ in 0..<6 {
      dataDirectoryURL.deleteLastPathComponent()
    }
    dataDirectoryURL.appendPathComponent("Data")
    var isDirectory: ObjCBool = false
    let exists = FileManager.default.fileExists(
      atPath: dataDirectoryURL.path,
      isDirectory: &isDirectory
    )
    precondition(isDirectory.boolValue && exists)
    return dataDirectoryURL
  }(#filePath)

  private static let contentDictionary = { dataDirectoryURL in
    do {
      let pairs = try FileManager.default.contentsOfDirectory(
        at: dataDirectoryURL, includingPropertiesForKeys: nil
      )
      .map {
        try ($0.deletingPathExtension().lastPathComponent, String(contentsOf: $0))
      }
      return Dictionary(uniqueKeysWithValues: pairs)
    } catch {
      fatalError("Unable to load test data from \(dataDirectoryURL.path): \(error)")
    }
  }(dataDirectoryURL)

  internal static let myYearInReviewContent: String = content("MyYearInReviewContent")

  internal static let areWeThereYetContent: String = content("AreWeThereYetContent")

  internal static let fromGoalsToActionsContent: String = content("AreWeThereYetContent")

  internal static let podcastingContent: String = content("PodcastingContent")

  internal static let productivityContent: String = content("ProductivityContent")

  internal static let wpExport: String = content("WPExport")

  private static func content(_ name: String) -> String {
    guard let content = contentDictionary[name] else {
      preconditionFailure("Missing test data content named \(name).")
    }
    return content
  }
}
