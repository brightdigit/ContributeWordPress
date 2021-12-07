import SyndiKit

extension Sequence {
  func postSatisfiesAll(_ post: WordPressPost) -> Bool where Element == PostFilter {
    allSatisfy {
      $0.include(post)
    }
  }

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

  func uniqueByKey<Key: Hashable, Value>() -> [Key: Value] where Element == (Key, Value) {
    return Dictionary(uniqueKeysWithValues: self)
  }

  func groupByKey<Key: Hashable, Value>() -> [Key: [Value]] where Element == (Key, Value) {
    return Dictionary(grouping: self, by: { $0.0 }).mapValues { $0.map(\.1) }
  }
}
