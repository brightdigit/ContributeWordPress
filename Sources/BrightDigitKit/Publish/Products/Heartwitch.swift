import Foundation

extension Product {
  static let heartwitch: Product =
    .init(title: "Heartwitch", description: "Show your heart rate as you live stream with this watch app!", isOpenSource: false, logo: "/media/images/products/heartwitch/logo.svg", style: .square, screenshots: [
      "/media/images/products/heartwitch/watch/002.ActiveWorkout.PNG",
      "/media/images/products/heartwitch/web/001.LoginScreen.png",
      "/media/images/products/heartwitch/livestream/Heartwitch-BOTW-HCG.png",
      "/media/images/products/heartwitch/web/002.CodeScreen.png",
      "/media/images/products/heartwitch/livestream/Heartwitch-SMK8D-RR.png",
      "/media/images/products/heartwitch/livestream/Heartwitch-SMK8D-MC.png",
      "/media/images/products/heartwitch/watch/001.StartWorkout.PNG",
      "/media/images/products/heartwitch/livestream/Heartwitch-BOTW-SMG.png",
      "/media/images/products/heartwitch/web/003.ActiveScreen.png",
      "/media/images/products/heartwitch/livestream/Heartwitch-SMK8D-DKJ.png"

    ], platforms: ["web", "watchOS"], technologies: ["Vapor", "HealthKit", "Heroku", "PostgreSQL"], productURL: "https://heartwitch.app/")
}
