
import Foundation


@main
struct json_reverse {

    static func main() {

      let inputData = FileHandle.standardInput.readDataToEndOfFile()
      let json = try! JSONSerialization.jsonObject(with: inputData, options: [])

      guard let array = json as? [Any] else {
        FileHandle.standardError.write("❗️ Invalid JSON array".data(using: .utf8)!)
        exit(1)
      }

      let reversed = Array(array.reversed())
      let outputData = try! JSONSerialization.data(withJSONObject: reversed, options: [.prettyPrinted])

      FileHandle.standardOutput.write(outputData)
    }
}
