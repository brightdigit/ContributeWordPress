import Foundation
import Publish
import ShellOut

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
extension URL {
  func relativePath(from base: URL) -> String? {
    // Ensure that both URLs represent files:
    guard isFileURL, base.isFileURL else {
      return nil
    }

    // Remove/replace "." and "..", make paths absolute:
    let destComponents = standardized.pathComponents
    let baseComponents = base.standardized.pathComponents

    let index = (zip(baseComponents, destComponents).enumerated().first { element in
      element.element.0 != element.element.1
    }?.offset ?? min(baseComponents.count, destComponents.count))

    // Build relative path:
    var relComponents = Array(repeating: "..", count: baseComponents.count - index)
    relComponents.append(contentsOf: destComponents[index...])
    return relComponents.joined(separator: "/")
  }
}

public extension PublishingStep {
  @available(*, deprecated)
  static var webpack: Self {
    .step(named: "Create JS using Webpack") { context in
      let npmPath = ProcessInfo.processInfo.environment["NPM_PATH"] ?? "npm"
      let folder = try context.folder(at: "Styling")
      let cssFile = try context.createOutputFile(at: "js/main.js")
      let path = "../\(cssFile.url.relativePath(from: folder.url)!)"
      try shellOut(to: "\(npmPath) ci; \(npmPath) run publish -- --output-filename \"\(path)\"", at: folder.path)
    }
  }
}
