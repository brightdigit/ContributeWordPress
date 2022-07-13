import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public protocol URLDownloader {
  func download(from fromURL: URL, to toURL: URL, allowOverwrite: Bool, _ completion: @escaping (Error?) -> Void)
}
