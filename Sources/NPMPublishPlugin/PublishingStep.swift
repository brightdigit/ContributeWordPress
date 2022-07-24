import struct Files.Folder
import Foundation
import Publish
import ShellOut

public extension PublishingStep {
  static func npm(run jobs: [NPM.Job], withSettings settings: NPM.Settings) -> Self {
    .step(named: "Running npm Job...", body: { context in
      let folderPath = try settings.folder(usingContext: context).path

      let commands: [ShellOutCommand] = try jobs.map { job in
        try .npm(job, withSettings: settings, andContext: context)
      }

      for command in commands {
        try shellOut(to: command, at: folderPath)
      }

    })
  }

  static func npm(_ npmPath: String? = nil, at folder: Folder = .current, @NPM.JobBuilder _ jobs: () -> [NPM.Job]) -> Self {
    Self.npm(run: jobs(), withSettings: .init(npmPath: npmPath, location: .folder(folder)))
  }

  static func npm(_ npmPath: String? = nil, at relativePath: Path, @NPM.JobBuilder _ jobs: () -> [NPM.Job]) -> Self {
    Self.npm(run: jobs(), withSettings: .init(npmPath: npmPath, location: .path(relativePath)))
  }
}
