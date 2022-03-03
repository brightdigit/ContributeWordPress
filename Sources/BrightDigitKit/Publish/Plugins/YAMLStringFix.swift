import Foundation
import Publish

public extension PublishingStep {
  static var yamlStringFix: Self {
    .step(named: "Dequoting YAML Metadata") { context in
      context.mutateAllSections { section in
        section.mutateItems { item in
          item.title = item.title.fixEmojiis().dequote()
          item.description = item.description.fixEmojiis().dequote()
        }
      }
    }
  }
}
