import Foundation

struct TransistorEmbedGenerator {
  struct Error: LocalizedError {
    var localizedDescription: String

    static let invalidURL = Error(localizedDescription: "Failed to construct an URL")
    static let timeout = Error(localizedDescription: "The request to Twitter's embed API timed out")
  }

  let transistorURL: URL

  init(url: URL) {
    transistorURL = url
  }

  private func html(from id: String) -> String {
    """
    <iframe width="100%" height="180" frameborder="no" scrolling="no" seamless src="https://share.transistor.fm/e/\(id)"></iframe>
    """
  }

  func generate() -> EmbeddedTransistor {
    EmbeddedTransistor(html: html(from: transistorURL.lastPathComponent))
  }
}
