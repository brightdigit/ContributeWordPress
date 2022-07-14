import Foundation
import Options

extension EnumSet where EnumType: MappedValueRepresentable {
  func asMappedType() throws -> [EnumType.MappedType] {
    try array().map(\.rawValue).map(EnumType.mappedValue(basedOn:))
  }

  static func mappedTypes(for items: [EnumType]) throws -> [EnumType.MappedType] {
    try Self(values: items).asMappedType()
  }
}

struct Product {
  enum Platform: Int, MappedValueCollectionRepresented, CaseIterable {
    typealias MappedType = String

    case web
    case macOS
    case iOS
    case watchOS
    case tvOS

    static let mappedValues = [
      "web",
      "macOS",
      "iOS",
      "watchOS",
      "tvOS"
    ]
  }

  enum Technology: Int, MappedValueCollectionRepresented, CaseIterable {
    typealias MappedType = String
    case vapor
    case healthkit
    case heroku
    case postgreSQL
    case swiftUI
    case cloudkit

    static var mappedValues = [
      "Vapor",
      "HealthKit",
      "Heroku",
      "PostgreSQL",
      "SwiftUI",
      "CloudKit"
    ]
  }

  struct Image {
    fileprivate init(path: String) {
      self.path = path
    }

    static func logo(withName name: String?) -> Image {
      at(path: name ?? "logo.svg")
    }

    static func at(path: String) -> Image {
      self.init(path: path)
    }

    static let basePath = "/media/products"
    let path: String

    func string(basedOnSlug slug: String) -> String {
      [Self.basePath, slug, path].joined(separator: "/")
    }
  }

  static let all: [Product] = [
    .heartwitch,
    .gbeat,
    .speculid,
    .orchardnest,
    .mistkit
  ]

  // swiftlint:disable force_try
  internal init(title: String, description: String, logo: Image = .logo(withName: nil), style: Product.ScreenshotStyle = .default, screenshots: [Image] = [], pressCoverage: [Product.PressCoverage] = [], platforms: [Product.Platform], technologies: [Product.Technology], productURL: String, githubRepoName: String? = nil) {
    let slug = title.convertedToSlug()
    try! self.init(
      title: title,
      description: description,
      isOpenSource: githubRepoName != nil,
      logo: logo.string(basedOnSlug: slug),
      style: style,
      screenshots: screenshots.map {
        $0.string(basedOnSlug: slug)
      },
      pressCoverage: pressCoverage,
      platforms: EnumSet.mappedTypes(for: platforms),
      technologies: EnumSet.mappedTypes(for: technologies),
      productURL: productURL,
      githubURL: githubRepoName.map { "https://github.com/BrightDigit/" + $0 }
    )
  }

  // swiftlint:enable force_try

  private init(title: String, description: String, isOpenSource: Bool = false, logo: String, style: Product.ScreenshotStyle = .default, screenshots: [String] = [], pressCoverage: [Product.PressCoverage] = [], platforms: [String], technologies: [String], productURL: String, githubURL: String? = nil) {
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
    // periphery:ignore
    internal init(source: String, quote: String, url: String, date: Date) {
      self.source = source
      self.quote = quote
      self.url = URL(string: url)!
      self.date = date
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
