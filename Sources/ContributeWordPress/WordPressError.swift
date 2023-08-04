import Contribute
import Foundation

public enum WordPressError: ContributeError {
  case assetDownloadErrors([URL: Error])
}
