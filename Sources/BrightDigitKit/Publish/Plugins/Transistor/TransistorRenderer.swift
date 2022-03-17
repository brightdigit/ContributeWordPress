public protocol TransistorRenderer {
  func render(transistor: EmbeddedTransistor) -> String
}

public final class DefaultTransistorRenderer: TransistorRenderer {
  public init() {}
  public func render(transistor: EmbeddedTransistor) -> String { transistor.html }
}
