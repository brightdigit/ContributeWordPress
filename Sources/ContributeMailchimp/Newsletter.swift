import Contribute
import Foundation
import Prch
import Spinetail

public enum Newsletter: ContentType {
  public typealias SourceType = Source
  public typealias ContentURLGeneratorType = BasicContentURLGenerator
  public typealias MarkdownExtractorType = MarkdownExtractor
  public typealias FrontMatterTranslatorType = FrontMatterTranslator
}

public extension Newsletter {
  static func client<SessionType: Session>(withAPIKey mailchimpAPIKey: String, usingSession session: SessionType) -> Client<SessionType, Mailchimp.API> {
    let api = Spinetail.Mailchimp.API(apiKey: mailchimpAPIKey)!
    return Client(api: api, session: session)
  }
}
