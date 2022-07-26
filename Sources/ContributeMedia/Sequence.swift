import SyndiKit

extension Sequence {
  func chunked(by distance: Int) -> [[Element]] {
    var result: [[Element]] = []
    var batch: [Element] = []

    for element in self {
      batch.append(element)

      if batch.count == distance {
        result.append(batch)
        batch = []
      }
    }

    if !batch.isEmpty {
      result.append(batch)
    }

    return result
  }

  func cumulate<ValueType, SuccessType>(_ map: @escaping (ValueType?) throws -> [SuccessType]) -> Result<[SuccessType], Error> where Element == Result<ValueType, Error>? {
    do {
      let videos = try reduce([SuccessType].init()) { partialResult, result in
        let value = try result?.get()
        let items = try map(value)
        return partialResult + items
      }
      return .success(videos)
    } catch {
      return .failure(error)
    }
  }
}
