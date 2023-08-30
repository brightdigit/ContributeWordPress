import Foundation

extension URL {
  internal static func make(string: String) throws -> URL {
    guard let url = URL(string: string) else {
      throw URLError.invalidURLString
    }

    return url
  }
}
