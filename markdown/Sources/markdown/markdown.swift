
import Ink
import Foundation

@main
struct markdown {
  static func main() {

    let parser = MarkdownParser()
    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      for arg in args {
        do {
          let contents = try String(contentsOfFile: arg, encoding: .utf8)
          let html = parser.html(from: contents)
          print(html)
        } catch {
          FileHandle.standardError.write(Data("❗️ \(error)".utf8))
          exit(1)
        }
      }
      exit(0)
    }

    let data = FileHandle.standardInput.readDataToEndOfFile()
    let result = String(decoding: data, as: UTF8.self)

    let html = parser.html(from: result)
    print(html)
  }
}
