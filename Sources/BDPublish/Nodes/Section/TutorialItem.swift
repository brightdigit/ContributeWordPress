enum TutorialPostable: Postable {
  static let sectionH1 = "Latest Developer Tutorials"
  static let sectionTitle = "Tutorials – Learn how build better Swift apps"
  static let sectionDescription = "Read our Tutorials and Development Articles on how to build the best apps you can for Apple Devices"

  static let twitterSource: String = "leogdion"
}

typealias TutorialItem = PostItem<TutorialPostable>
