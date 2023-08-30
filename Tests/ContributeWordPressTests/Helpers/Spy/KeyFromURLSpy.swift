import Foundation

internal final class KeyFromURLSpy {
  internal var keyFromURLIsCalled: Bool = false

  internal func keyFromURL(_: URL) -> String {
    keyFromURLIsCalled = true
    return "section-name"
  }
}
