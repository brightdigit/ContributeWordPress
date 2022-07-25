import Foundation

public enum YAML {
  public static let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = .current
    return dateFormatter
  }()
}
