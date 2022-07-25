import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension BrightDigitSiteCommand.ImportCommand.WordPress {
  var contentPathURL: URL {
    URL(fileURLWithPath: exportMarkdownDirectory, relativeTo: FileManager.default.currentDirectoryURL)
  }

  var resourcesPathURL: URL {
    URL(fileURLWithPath: exportResourcesDirectory, relativeTo: FileManager.default.currentDirectoryURL)
  }

  var directoryURL: URL {
    URL(fileURLWithPath: wordpressExportsDirectory, relativeTo: FileManager.default.currentDirectoryURL)
  }

  var resourceImagePathURL: URL {
    resourcesPathURL.appendingPathComponent(imageRelativePath)
  }
}
