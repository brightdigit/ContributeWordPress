import Foundation
import Plot
import Publish
import ShellOut

// This type acts as the configuration for your website.
struct BrightDigit: Website {
  enum SectionID: String, WebsiteSectionID {
    // Add the sections that you want your website to contain here:
    case articles
    case episodes
    case videos
    case tutorials
  }

  struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
  }

  // Update these properties to configure your website:
  var url = URL(string: "https://brightdigit.com")!
  var name = "BrightDigit"
  var description = "A description of BrightdigitCom"
  var language: Language { .english }
  var imagePath: Path? { nil }
}

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
    return .step(named: "Create CSS From TailwindCSS") { context in
      let folder = try context.folder(at: "Styling")
      let cssFile = try context.createOutputFile(at: "css/styles.css")

      try shellOut(to: "npm install; npm run publish -- -o \(cssFile.path)", at: folder.path)
    }
  }
}

try BrightDigit().publish(using: [
  .optional(.copyResources()),
  .addMarkdownFiles(),
  .sortItems(by: \.date, order: .descending),

  .generateHTML(withTheme: .company, indentation: .spaces(2)),
  .generateSiteMap(),

  .tailwindCSS,
  .generateRSSFeed(including: [.articles, .tutorials])
])
