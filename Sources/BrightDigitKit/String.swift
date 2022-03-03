import Foundation

extension String {
  private static let quotes = ["\"", "'"]

  private static let slugSafeCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-")

  // swiftlint:disable:next force_try
  private static let escUnicodeRegex = try! NSRegularExpression(
    pattern: "\\\\U([0-9a-f]{8})",
    options: [.caseInsensitive]
  )

  func fixUnicodeEscape() -> String {
    replacingOccurrences(of: "’", with: "'")
  }

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

  func dequote() -> String {
    let trimmedString = trimmingCharacters(in: .whitespacesAndNewlines)
    guard let first = trimmedString.first.map(String.init), let last = trimmedString.last.map(String.init), trimmedString.count > 1, last == first else {
      return trimmedString
    }

    guard Self.quotes.contains(first) else {
      return trimmedString
    }
    let startIndex = trimmedString.index(after: trimmedString.startIndex)
    let endIndex = trimmedString.index(before: trimmedString.endIndex)

    return String(trimmedString[startIndex ..< endIndex])
  }

  func padLeft(totalWidth: Int, byString: String) -> String {
    let toPad = totalWidth - count
    if toPad < 1 {
      return self
    }

    return "".padding(toLength: toPad, withPad: byString, startingAt: 0) + self
  }

  private func convertedToSlugBackCompat() -> String? {
    // On Linux StringTransform doesn't exist and CFStringTransform causes all sorts
    // of problems because of bridging issues using CFMutableString – d'oh.
    // So we're going to do the only thing possible: dump to ASCII and hope for the best
    if let data = data(using: .ascii, allowLossyConversion: true) {
      if let str = String(data: data, encoding: .ascii) {
        let urlComponents = str.lowercased().components(separatedBy: String.slugSafeCharacters.inverted)
        return urlComponents.filter { $0 != "" }.joined(separator: "-")
      }
    }

    // still here? Something went disastrously wrong!
    return nil
  }

  public func convertedToSlug() -> String {
    var result: String?

    #if os(Linux)
      result = convertedToSlugBackCompat()
    #else
      if #available(OSX 10.11, *) {
        if let latin = self.applyingTransform(StringTransform("Any-Latin; Latin-ASCII; Lower;"), reverse: false) {
          let urlComponents = latin.components(separatedBy: String.slugSafeCharacters.inverted)
          result = urlComponents.filter { $0 != "" }.joined(separator: "-")
        }
      } else {
        result = convertedToSlugBackCompat()
      }
    #endif

    guard var result = result, result.count > 0 else {
      return self
    }

    var previous = result

    repeat {
      previous = result
      result = previous.replacingOccurrences(of: "--", with: "-")
    } while previous != result

    return result
  }
}
