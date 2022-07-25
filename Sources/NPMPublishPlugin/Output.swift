import struct Files.File
import struct Files.Folder
import Foundation

public protocol Output {
  var url: URL { get }
}

extension Files.File: Output {}

extension Folder: Output {}
