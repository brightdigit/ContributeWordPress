import Foundation
import Plot
import Publish

struct PiHTMLFactory: HTMLFactory {
  static let yearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
  }()

  static let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    return formatter
  }()

  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()

  static let formatTimeIntervalSufficies = ["h", "m"]

  static func formatTimeInterval(_ timeInterval: TimeInterval) -> String {
    let hoursDouble = floor(timeInterval / 60.0 / 60.0)
    let minutesDouble = (timeInterval - (hoursDouble * 60.0 * 60.0)) / 60.0
    return [hoursDouble, minutesDouble]
      .map(Int.init)
      .enumerated()
      .compactMap { index, value in
        guard value > 0 else {
          return nil
        }
        return ["\(value)", formatTimeIntervalSufficies[index]].joined(separator: "")
      }.joined(separator: " ")
  }

  // MARK: - makeIndexHTML

  func makeIndexHTML(for index: Index, context: PublishingContext<BrightDigitSite>) throws -> HTML {
    let setup = Pages.page(forIndex: index, withContext: context)
    return HTML(
      .makeHead(forPage: setup),
      .body(
        .headerNav(),
        setup.mainElement,
        .makeFooter()
      )
    )
  }

  // MARK: - makeSectionHTML

  func makeSectionHTML(for section: Section<BrightDigitSite>, context: PublishingContext<BrightDigitSite>) throws -> HTML {
    let content = try Pages.content(forSection: section, withContext: context)

    return HTML(
      .makeHead(forPage: content),
      .body(
        .unwrap(content.bodyID, Node.id),
        .unwrap(content.bodyClassValue, Node.class),
        .headerNav(),
        content.mainElement,
        .makeFooter()
      )
    )
  }

  // MARK: - makeItemHTML

  func makeItemHTML(for item: Item<BrightDigitSite>, context: PublishingContext<BrightDigitSite>) throws -> HTML {
    let content = try Pages.content(forItem: item, withContext: context)
    return HTML(
      .makeHead(forPage: content, item: item),
      .body(
        .unwrap(content.bodyID, Node.id),
        .unwrap(content.bodyClassValue, Node.class),
        .headerNav(),
        content.mainElement,
        .makeFooter()
      )
    )
  }

  // MARK: - makePageHTML

  func makePageHTML(for page: Page, context: PublishingContext<BrightDigitSite>) throws -> HTML {
    let content = try Pages.content(basedOnPage: page, withContext: context)
    return HTML(
      .makeHead(forPage: content),
      .body(
        .unwrap(content.bodyID, Node.id),
        .headerNav(),
        content.mainElement,
        .makeFooter()
      )
    )
  }

  // MARK: - makeTagListHTML

  func makeTagListHTML(for _: TagListPage, context _: PublishingContext<BrightDigitSite>) throws -> HTML? {
    nil
  }

  // MARK: - makeTagDetailsHTML

  func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<BrightDigitSite>) throws -> HTML? {
    nil
  }

  typealias Site = BrightDigitSite
}

// MARK: - Theme

extension Theme where Site == BrightDigitSite {
  static var company: Self {
    Theme(htmlFactory: PiHTMLFactory())
  }
}
