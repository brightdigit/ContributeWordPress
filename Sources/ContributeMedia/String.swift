import Foundation

extension String {
  private static let slugSafeCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-")

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

extension String {

  public static let allParagraphTagRegex = try! NSRegularExpression(pattern: "<p[^>]*>(.*?)</p>", options: [])

  public func firstSummaryParagraph() -> String? {
    guard let htmlFirstParagraph = self.firstParagraphTag() else {
      return firstParagraphText()
    }

    return htmlFirstParagraph
  }

  public func firstParagraphText() -> String? {
    components(separatedBy: .newlines).first { line in
      !line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }?.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  public func firstParagraphTag() -> String? {
    let range = NSRange(location: 0, length: self.utf16.count)

    guard let match = String.allParagraphTagRegex.firstMatch(in: self, options: [], range: range) else {
      return nil
    }

    return (self as NSString).substring(with: match.range(at: 1))
  }
}
