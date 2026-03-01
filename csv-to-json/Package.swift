// swift-tools-version: 6.2


import PackageDescription

let package = Package(
    name: "csv-to-json",
    platforms: [.macOS(.v10_15)],
    dependencies: [
      .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.0")
      // .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.11.3")
    ],

    targets: [
        .executableTarget(
            name: "csv-to-json",
            dependencies: [
              .product(name: "SwiftCSV", package: "SwiftCSV")
            ]
        ),
    ]
)
