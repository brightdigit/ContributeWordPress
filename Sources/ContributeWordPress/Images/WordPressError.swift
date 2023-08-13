import Contribute
import Foundation

/// Errors thrown in the process of importing.
public enum WordPressError: ContributeError {
  /// Errors downloading from URLs.
  case assetDownloadErrors([URL: Error])
}
