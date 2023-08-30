import ContributeWordPress
import Foundation

internal struct SettingsStub: ProcessorSettings {
  internal let rootPublishSiteURL: URL = .temporaryDirURL

  internal var contentPathURL: URL {
    rootPublishSiteURL.appendingPathComponent(PublishDefaults.contentDirectoryName)
  }

  internal var resourcesPathURL: URL {
    rootPublishSiteURL.appendingPathComponent(PublishDefaults.resourcesDirectoryName)
  }

  internal var exportsDirectoryURL: URL {
    rootPublishSiteURL.appendingPathComponent("WordPress/exports")
  }

  internal var overwriteAssets: Bool { true }

  internal var assetImportSetting: AssetImportSetting { .download }

  internal var assetRelativePath: String {
    rootPublishSiteURL
      .appendingPathComponent(PublishDefaults.wpAssetsRelativePath)
      .absoluteString
  }

  internal func markdownFrom(html _: String) throws -> String {
    "nothing for now"
  }
}
