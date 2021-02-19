import MarkdownGenerator

public struct MarkdownItem {
  internal init(specs: Specs, markdown: MarkdownConvertible) {
    self.specs = specs
    self.markdown = markdown
  }

  let specs: Specs
  let markdown: MarkdownConvertible
}
