import Foundation

extension String {
  private static let quotes = ["\"", "'"]

  func fixUnicodeEscape() -> String {
    replacingOccurrences(of: "’", with: "'")
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
}
