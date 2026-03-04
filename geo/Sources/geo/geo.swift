
import CoreLocation
import Foundation

func x(_ message: String) {
  FileHandle.standardError.write(Data("❗️ \(message)".utf8))
}

@main
struct geo {

  static func main() async {

    var address = ""
    if CommandLine.arguments.count > 1 {
      address = CommandLine.arguments.dropFirst().joined(separator: " ")
    }
    else {
      let data = FileHandle.standardInput.readDataToEndOfFile()
      address = String(decoding: data, as: UTF8.self)
    }

    address = address.trimmingCharacters(in: .whitespacesAndNewlines)
    if address.isEmpty {
      x("Usage: geo <address>")
      exit(1)
    }

    let geocoder = CLGeocoder()

    do {
      let placemarks = try await geocoder.geocodeAddressString(address)
      guard
        let placemark = placemarks.first,
        let location = placemark.location
        // let addr = placemark.name,
        // let locality = placemark.locality,
        // let administrative = placemark.administrativeArea
      else {
        x("No address found")
        exit(1)
      }

      let c = location.coordinate
      print("\(c.latitude), \(c.longitude)")
    } catch {
      x(error.localizedDescription)
      exit(1)
    }
  }
}
