
import SwiftCSV
import Foundation

struct CSVError: Error, CustomStringConvertible {
  let message: String

  var description: String {
    return self.message
  }
}


func csvToJSON(string: String) throws -> String {

  let csv = try CSV<Named>(string: string)
  let json = try JSONEncoder().encode(csv.rows)


    
  guard let str = String(data: json, encoding: .utf8) else {
    throw CSVError(message: "Unable to parse CSV")
  }

  return str
}


@main
struct csv_to_json {
  static func main() {

    let data = FileHandle.standardInput.readDataToEndOfFile()
    let stdin = String(decoding: data, as: UTF8.self)
    do {
      let json = try csvToJSON(string: stdin)
      print(json)
    } catch {
      FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
    }
  }
}
