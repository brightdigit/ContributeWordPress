import Foundation

import ArgumentParser

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension BrightDigitSiteCommand.ImportCommand.WordPress {
  var contentPathURL: URL {
    URL(fileURLWithPath: exportMarkdownDirectory)
  }

  var resourcesPathURL: URL {
    URL(fileURLWithPath: exportResourcesDirectory)
  }

  var directoryURL: URL {
    URL(fileURLWithPath: wordpressExportsDirectory)
  }

  var resourceImagePathURL: URL {
    resourcesPathURL.appendingPathComponent(imageRelativePath)
  }
}
