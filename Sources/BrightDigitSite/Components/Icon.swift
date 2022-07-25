import Plot

struct Icon: Component {
  let className: String
  var body: Component {
    Element(name: "i") {}.class(className)
  }
}
