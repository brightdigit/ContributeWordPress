import Foundation

final class KeyFromURLSpy {
  var keyFromURLIsCalled: Bool = false

  func keyFromURL(_ url: URL) -> String {
    keyFromURLIsCalled = true
      return "section-name"
  }
}
