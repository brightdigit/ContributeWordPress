import Foundation

struct Product {
  static let all: [Product] = [
    .heartwitch
  ]

  internal init(title: String, description: String, isOpenSource: Bool = false, logo: String, style: Product.ScreenshotStyle = .default, screenshots: [String] = [], pressCoverage: [Product.PressCoverage] = [], platforms: [String], technologies: [String], productURL: String, githubURL: String? = nil) {
    self.description = description
    self.title = title
    self.isOpenSource = isOpenSource
    self.logo = URL(string: logo)!
    self.style = style
    self.screenshots = screenshots
    self.pressCoverage = pressCoverage
    self.platforms = platforms
    self.technologies = technologies
    self.productURL = URL(string: productURL)!
    self.githubURL = githubURL.map { URL(string: $0)! }
  }

  enum ScreenshotStyle: String, Codable, Equatable {
    case `default`, portrait, square
  }

  struct PressCoverage: Codable, Equatable, Hashable {
    internal init(source: String, quote: String, url: String, date: String) {
      self.source = source
      self.quote = quote
      self.url = URL(string: url)!
      self.date = PiHTMLFactory.dateFormatter.date(from: date)!
    }

    let source: String
    let quote: String
    let url: URL
    let date: Date
  }

  let title: String
  let description: String
  let isOpenSource: Bool
  let logo: URL
  let style: ScreenshotStyle
  let screenshots: [String]
  let pressCoverage: [PressCoverage]
  let platforms: [String]
  let technologies: [String]

  let productURL: URL
  let githubURL: URL?
}
