import Foundation
@available(*, deprecated)
struct TransistorEmbedConfiguration {
  var width: Int
  var height: Int

  init(width: Int = 560, height: Int = 315) {
    self.width = width
    self.height = height
  }

  static var `default`: TransistorEmbedConfiguration { TransistorEmbedConfiguration() }
}
