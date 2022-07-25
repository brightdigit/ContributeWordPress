import Foundation
import Plot

public struct Testimonial: Hashable, Comparable {
  static var lastID = 0
  public static func == (lhs: Testimonial, rhs: Testimonial) -> Bool {
    lhs.id == rhs.id
  }

  public static func < (lhs: Testimonial, rhs: Testimonial) -> Bool {
    lhs.id < rhs.id
  }

  static let all: Set<Self> = .init([
    .derekDeJonghe, .daveCIO, .tomAssetHealth, .daveAM, .jody, .flickCMC, .hrAssetHealth, .davidSmith, .edCMC
  ])

  internal init(id: Int? = nil, fullName: String, title: String, fullQuote: String, briefQuote: String? = nil, url: URL? = nil) {
    self.id = id ?? (Self.lastID + 1)
    Self.lastID += 1
    self.fullName = fullName
    self.title = title
    self.fullQuote = fullQuote
    self.briefQuote = briefQuote ?? fullQuote
    self.url = url
  }

  let id: Int
  let fullName: String
  let title: String

  let fullQuote: String
  let briefQuote: String

  let url: URL?
}

extension Testimonial {
  static func listItem(_ testimonial: Testimonial) -> Node<HTML.ListContext> {
    .li(
      .element(named: "figure", nodes: [.blockquote(
        .p(
          .text(testimonial.briefQuote)
        )
      ), .element(named: "figcaption", nodes: [
        .text("-"),
        .text(testimonial.fullName),
        .text(", "),
        .element(named: "cite", nodes: [.text(testimonial.title)])
      ])])
    )
  }
}
