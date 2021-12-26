import Foundation

enum YAML {
  static let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = .current
    return dateFormatter
  }()
}
