import Foundation
import Publish
import ShellOut

extension PublishingStep {
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
