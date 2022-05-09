import Foundation
import Ink
import Publish

public extension Plugin {
  static func transistor(renderer: TransistorRenderer = DefaultTransistorRenderer()) -> Self {
    Plugin(name: "Transistor") { context in
      context.markdownParser.addModifier(.transistorBlockQuote(using: renderer))
    }
  }
}

public extension Modifier {
  static func transistorBlockQuote(using renderer: TransistorRenderer) -> Self {
    Modifier(target: .blockquotes) { html, markdown in
      let prefix = "transistor "
      var markdown = markdown.dropFirst().trimmingCharacters(in: .whitespaces)
      guard markdown.hasPrefix(prefix) else {
        return html
      }

      markdown = markdown.dropFirst(prefix.count).trimmingCharacters(in: .newlines)

      guard let url = URL(string: markdown) else {
        fatalError("Invalid transistor URL \(markdown)")
      }

      let generator = TransistorEmbedGenerator(url: url)
      let transistor = generator.generate()
      return renderer.render(transistor: transistor)
    }
  }
}
