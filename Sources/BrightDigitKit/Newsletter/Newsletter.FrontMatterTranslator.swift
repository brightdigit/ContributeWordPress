#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension Newsletter {
  struct FrontMatterTranslator: BrightDigitKit.FrontMatterTranslator {
    public init() {}
    public func frontMatter(from source: Source) -> FrontMatter {
      FrontMatter(issueNo: source.issueNo, campaignID: source.campaignID, featuredImage: source.featuredImageURL, longArchiveURL: source.longArchiveURL, newsletterTitle: source.title, title: source.subjectLine, date: YAML.dateFormatter.string(from: source.sendTime), description: source.previewText)
    }

    public typealias FrontMatterType = FrontMatter

    public typealias SourceType = Source
  }
}
