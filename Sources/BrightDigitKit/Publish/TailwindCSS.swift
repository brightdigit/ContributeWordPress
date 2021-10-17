import Publish
import ShellOut

extension Plugin {
  @available(OSX 10.12, *)
  static var tailwindCss: Self {
    Plugin(name: "Tailwind") { context in
      let folder = try context.folder(at: "Content/styling")
      let cssFile = try context.createOutputFile(at: "css/styles.css")
      try shellOut(to: "npm run publish -- -o \(cssFile.url.absoluteString)", at: folder.path)
    }
  }
}

extension PublishingStep {
  static var tailwindCSS: Self {
    .step(named: "Create CSS From TailwindCSS") { context in
      let folder = try context.folder(at: "Styling")
      let cssFile = try context.createOutputFile(at: "css/styles.css")

      try shellOut(to: "npm install; npm run publish -- -o \(cssFile.path)", at: folder.path)
    }
  }
}
