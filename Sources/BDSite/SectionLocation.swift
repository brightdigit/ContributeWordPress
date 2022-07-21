import Foundation
import Publish

protocol SectionLocation: Location {
  associatedtype WebsiteType: Website
  var sectionID: WebsiteType.SectionID { get }
}

// extension Section: SectionLocation where Site == BrightDigitSite {
//  var sectionID: BrightDigitSite.SectionID {
//    id
//  }
// }
//
// extension Item: SectionLocation where Site == BrightDigitSite {}
