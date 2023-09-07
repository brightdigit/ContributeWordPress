import Foundation

/// The method to import assets from the WordPress site.
public enum AssetImportSetting: Equatable {
  /// Don't import any assets
  case none
  /// Download them from the WordPress site.
  case download
  /// Copy the files from a local mapped location.
  case copyFilesFrom(URL)
}

extension AssetImportSetting {
  internal var importPathURL: URL? {
    if case let .copyFilesFrom(url) = self {
      return url
    }

    return nil
  }
}
