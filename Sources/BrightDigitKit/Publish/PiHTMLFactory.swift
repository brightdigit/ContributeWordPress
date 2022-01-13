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

    switch section.id {
    default:
      return HTML(
        .makeHead(forPage: content),
        .body(
          .headerNav(),
          content.mainElement,
          .makeFooter()
        )
      )
    }
  }

  // MARK: - makeItemHTML

  func makeItemHTML(for item: Item<BrightDigitSite>, context _: PublishingContext<BrightDigitSite>) throws -> HTML {
    HTML(
      .makeHead(forPage: MockContent()),
      .body(
        .headerNav(),
        .main(
          .article(
            .div(
              .class("content"),
              .contentBody(item.body)
            ),
            .span("Tagged with: ")
            // .tagList(for: item, on: context.site)
          )
        ),
        .makeFooter()
      )
    )
  }

  // MARK: - makePageHTML

  func makePageHTML(for page: Page, context: PublishingContext<BrightDigitSite>) throws -> HTML {
    let content = (try? Pages.content(basedOnPage: page, withContext: context)) ?? MockContent()
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
    HTML(
      .makeHead(forPage: MockContent()),
      .body(
        .text("makeTagListHTML")
      )
    )
  }

  // MARK: - makeTagDetailsHTML

  func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<BrightDigitSite>) throws -> HTML? {
    HTML(
      .makeHead(forPage: MockContent()),
      .body(
        .text("makeTagDetailsHTML")
      )
    )
  }

  typealias Site = BrightDigitSite
}

// MARK: - Theme

extension Theme where Site == BrightDigitSite {
  static var company: Self {
    Theme(htmlFactory: PiHTMLFactory())
  }
}
