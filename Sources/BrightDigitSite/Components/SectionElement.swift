import Plot

struct SectionElement: Component {
  let content: ContentProvider
  init(
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.content = content
  }

  var body: Component {
    Element(name: "section", content: content)
  }
}
