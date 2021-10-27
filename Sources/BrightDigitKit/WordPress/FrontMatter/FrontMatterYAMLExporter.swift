import Foundation
import SyndiKit
import Yams

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct FrontMatterYAMLExporter<FrontMatterTranslatorType: FrontMatterTranslator>: FrontMatterExporter {
  init(translator: FrontMatterTranslatorType) {
    self.translator = translator
  }

  let translator: FrontMatterTranslatorType
  let formatter: FrontMatterFormatter = YAMLEncoder()

  public func frontMatterText(fromWordPressPost post: WordPressPost, withFeaturedImage featuredImage: String?) throws -> String {
    let specs = translator.frontMatter(fromWordpresPost: post, withFeaturedImage: featuredImage)
    let frontMatterText = try formatter.format(specs)
    return frontMatterText
  }
}

extension FrontMatterYAMLExporter {
  init() where FrontMatterTranslatorType == SpecFrontMatterTranslator {
    self.init(translator: SpecFrontMatterTranslator())
  }
}
