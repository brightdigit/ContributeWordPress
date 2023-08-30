import ContributeWordPress
import Foundation

internal struct AssetDownloaderStub: Downloader {
  internal func download(assets: [AssetImport], allowsOverwrites _: Bool) throws {
    // doing nothing
  }
}
