// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "markdown",
    platforms: [.macOS(.v10_15)],
    dependencies: [
      .package(url: "https://github.com/johnsundell/ink.git", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "markdown",
            dependencies: [
                        .product(name: "Ink", package: "ink")
                    ]
        ),
        
    ]
)
