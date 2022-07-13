import Foundation

extension Product {
  static let mistkit: Product =
    .init(
      title: "MistKit",
      description: """
      ### Swift Package for Service-Side & Command-Line Access to the Apple CloudKit framework

      Use MistKit for

      * Easily migrate data to and from CloudKit
      * Building Command-Line Applications
      * Running apps on non-Apple operating systems
      * Server-side integration (via Vapor)
      * Access serverless computing (via AWS Lambda)
      * And more!
      """, screenshots: [
        .at(path: "MistKitDemo.gif")
      ], platforms: [.web], technologies: [.vapor, .cloudkit], productURL: "http://mistkit.in", githubRepoName: "MistKit"
    )
}
