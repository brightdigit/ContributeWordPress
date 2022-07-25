import Foundation
import Publish

public extension String {
  // swiftlint:disable:next force_try
  private static let escUnicodeRegex = try! NSRegularExpression(
    pattern: "\\\\U([0-9a-f]{8})",
    options: [.caseInsensitive]
  )

  func fixEmojiis() -> String {
    let matches = Self.escUnicodeRegex.matches(
      in: self,
      range: .init(location: 0, length: count)
    ).reversed()
    var result = self
    for match in matches {
      guard let range = Range(match.range, in: result) else {
        continue
      }
      guard let codeRange = Range(match.range(at: 1), in: result) else {
        continue
      }
      let codeString = self[codeRange]
      guard let value = Int(codeString, radix: 16) else {
        continue
      }
      guard let scalar = UnicodeScalar(value) else {
        continue
      }
      result.replaceSubrange(range, with: String(scalar))
    }
    return result
  }
}

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
