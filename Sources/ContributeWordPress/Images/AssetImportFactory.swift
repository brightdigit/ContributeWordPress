import Foundation

/// A typealias that represents a factory function for creating asset imports.
public typealias AssetImportFactory =
  (_ site: WordPressSite, _ importSettings: ProcessorSettings) -> [AssetImport]
