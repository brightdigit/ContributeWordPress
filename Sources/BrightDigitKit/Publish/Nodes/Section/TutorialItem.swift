enum TutorialPostable: Postable {
  static var sectionH1 = "Latest Developer Tutorials"
  static let sectionTitle = "Tutorials – Learn how build better Swift apps"
  static let sectionDescription = "Read our Tutorials and Development Articles on how to build the best apps you can for Apple Devices"
}

typealias TutorialItem = PostItem<TutorialPostable>
