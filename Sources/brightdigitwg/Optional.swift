extension Optional {
  func flatMap<OtherValueType>(and other: OtherValueType?) -> (Wrapped, OtherValueType)? {
    flatMap { value in
      other.map {
        (value, $0)
      }
    }
  }
}
