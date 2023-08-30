import ContributeWordPress
import Foundation

internal struct AssetDownloaderStub: Downloader {
  internal func download(assets _: [AssetImport], allowsOverwrites _: Bool) throws {
    // doing nothing
  }
}
