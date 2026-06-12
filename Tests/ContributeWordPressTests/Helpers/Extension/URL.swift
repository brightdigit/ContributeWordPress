import Foundation

extension URL {
  internal init(staticString: StaticString) {
    guard let url = URL(string: .init(describing: staticString)) else {
      fatalError("Invalid URL String")
    }
    self = url
  }
}

extension URL {
  internal static func makeRootPublishSiteURL() -> URL {
    .temporaryDir.appendingPathComponent(UUID().uuidString)
  }
}
