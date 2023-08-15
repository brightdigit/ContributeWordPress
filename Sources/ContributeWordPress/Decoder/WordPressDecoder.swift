import Foundation
import SyndiKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A protocol for decoding WordPress sites from raw data.
public protocol WordPressDecoder {
  /// Decodes an array of WordPress sites from the given data.
  ///
  /// - Parameters:
  ///   - data: The data to decode.
  ///   - allowInvalidCharacters: Whether to allow invalid characters in the data.
  /// - Returns: An array of WordPress sites, or nil if decoding failed.
  /// - Throws: An error if data couldn't be decoded.
  func decodeSites(
    fromData data: Data,
    allowInvalidCharacters: Bool
  ) throws -> WordPressSite?
}
