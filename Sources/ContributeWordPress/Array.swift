import Foundation

/// This extension is used to combine two arrays of the same type.
extension Array {
  /// Combines the given two optional arrays.
  ///
  /// - Parameters:
  ///   - lhs: The first optional array.
  ///   - rhs: The second optional array.
  /// - Returns: A new array that is the combination of the two arrays.
  internal static func combine(_ lhs: Self?, _ rhs: Self?) -> Self? {
    guard let lhs = lhs else {
      return rhs
    }

    guard let rhs = rhs else {
      return lhs
    }

    return lhs + rhs
  }
}
