import Foundation

extension TimeInterval {
  init(iso6801 duration: String) {
    var duration = duration
    if duration.hasPrefix("PT") { duration.removeFirst(2) }
    let hour, minute, second: Double
    if let index = duration.firstIndex(of: "H") {
      hour = Double(duration[..<index]) ?? 0
      duration.removeSubrange(...index)
    } else { hour = 0 }
    if let index = duration.firstIndex(of: "M") {
      minute = Double(duration[..<index]) ?? 0
      duration.removeSubrange(...index)
    } else { minute = 0 }
    if let index = duration.firstIndex(of: "S") {
      second = Double(duration[..<index]) ?? 0
    } else { second = 0 }
    self.init(hour * 3600 + minute * 60 + second)
  }
}
