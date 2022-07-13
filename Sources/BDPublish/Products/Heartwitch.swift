import Foundation

extension Product {
  static let heartwitch: Product =
    .init(title: "Heartwitch", description: """
      ### Livestream Your Health Stats Straight From Your Apple Watch

      Heartwitch is a combination Apple Watch and Web App for sharing your health data online.

      Video game live streaming has become a mainstream form of entertainment, with viewers liking to see how streamers behave and react to gameplay. With Heartwitch, viewers can see how the streamer reacts on a physical level.

      See the streamer’s heart rate shift when hiding from a monster, driving a racecar around a tight bend, or as their favorite character dies in their arms.

      Unlike other apps that capture user health data, there is no need for extra hardware. It uses the built-in sensors of the Apple Watch to detect your heart rate and send it through our servers directly to your web browser.

    """, style: .square, screenshots: [
      .at(path: "watch/002.ActiveWorkout.PNG"),
      .at(path: "web/001.LoginScreen.png"),
      .at(path: "livestream/Heartwitch-BOTW-HCG.png"),
      .at(path: "web/002.CodeScreen.png"),
      .at(path: "livestream/Heartwitch-SMK8D-RR.png"),
      .at(path: "livestream/Heartwitch-SMK8D-MC.png"),
      .at(path: "watch/001.StartWorkout.PNG"),
      .at(path: "livestream/Heartwitch-BOTW-SMG.png"),
      .at(path: "web/003.ActiveScreen.png"),
      .at(path: "livestream/Heartwitch-SMK8D-DKJ.png")
    ], platforms: [.watchOS, .web], technologies: [.vapor, .healthkit, .heroku, .postgreSQL], productURL: "https://heartwitch.app/")
}
