import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URL {
  internal var firstHostComponent: String? {
    host?.components(separatedBy: ".").first
  }

  /// Returns the last path component of the URL without the file extension.
  ///
  /// - Returns: The last path component without the file extension.
  public func lastPathComponentWithoutExtension() -> String {
    deletingPathExtension().lastPathComponent
  }

  /// Calculates the relative path between two file URLs.
  ///
  /// - Parameter base: The base URL from which the relative path is calculated.
  /// - Returns: The relative path from the base URL to the current URL.
  internal func relativePath(from base: URL) -> String? {
    // Ensure that both URLs represent files:
    guard isFileURL, base.isFileURL else {
      return nil
    }

    // Remove/replace "." and "..", make paths absolute:
    let destComponents = standardized.pathComponents
    let baseComponents = base.standardized.pathComponents

    let index = (zip(baseComponents, destComponents).enumerated().first { element in
      element.element.0 != element.element.1
    }?.offset ?? min(baseComponents.count, destComponents.count))

    // Build relative path:
    var relComponents = Array(repeating: "..", count: baseComponents.count - index)
    relComponents.append(contentsOf: destComponents[index...])
    return relComponents.joined(separator: "/")
  }
}
