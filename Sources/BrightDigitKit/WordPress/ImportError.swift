import Foundation

public enum ImportError: Error {
  case directory(URL)
  case imageDownloads([URL: Error])
}
