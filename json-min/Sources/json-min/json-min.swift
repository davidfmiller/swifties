
import Foundation


@main
struct json_min {

  static func main() {

    let inputData = FileHandle.standardInput.readDataToEndOfFile()

    do {
      let json = try JSONSerialization.jsonObject(with: inputData, options: [])
      let outputData = try! JSONSerialization.data(withJSONObject: json, options: [])
      FileHandle.standardOutput.write(outputData)
    } catch {
      FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
    }
  }
}
