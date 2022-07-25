public protocol TransistorRenderer {
  func render(transistor: EmbeddedTransistor) -> String
}

public struct DefaultTransistorRenderer: TransistorRenderer {
  public init() {}
  public func render(transistor: EmbeddedTransistor) -> String { transistor.html }
}
