import Foundation
import Publish
import ShellOut

public extension NPM {
  @resultBuilder
  enum JobBuilder {
    public static func buildBlock(_ components: Job...) -> [Job] {
      components
    }
  }
}
