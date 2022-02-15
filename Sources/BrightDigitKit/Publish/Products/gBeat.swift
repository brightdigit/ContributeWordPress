import Foundation

extension Product {
  static let gbeat: Product =
    .init(title: "gBeat", description: """
     ## Transmit your heart rate data to your fitness instructor or coach in real-time, no matter where you are.

     Founded by fitness & tech enthusiasts looking to solve the problem of having heart rate data for instructors or trainers while they are streaming or coaching classes online.
    """, logo: .logo(withName: "logo.jpg"), style: .square, screenshots: [
      .at(path: "web/active-workout.png"),
      .at(path: "web/home-screen.png"),
      .at(path: "watch/active-workout.png"),
      .at(path: "watch/class-start.png"),
      .at(path: "watch/join-class.png"),
      .at(path: "web/classes.png")
    ], platforms: [.watchOS, .web], technologies: [.vapor, .healthkit, .heroku, .postgreSQL], productURL: "https://gbeat.com")
}
