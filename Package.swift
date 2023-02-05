// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Playgrounds",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(
            name: "Playgrounds",
            targets: ["Playgrounds", "APIClient", "IMDBAPIClient"]
            ),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", branch: "master")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "Playgrounds",
            dependencies: [
                .target(name: "APIClient"),
                .target(name: "IMDBAPIClient")
            ],
            path: "Sources/Playgrounds",
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-concurrency"])
            ]
        ),
        .target(
            name: "APIClient",
            dependencies: [],
            path: "Sources/APIClient",
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-concurrency"])
            ]
        ),
        .target(
            name: "IMDBAPIClient",
            dependencies: [
                .target(name: "APIClient")
            ],
            path: "Sources/IMDBAPIClient",
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-concurrency"])
            ]
        ),
       
        .testTarget(
            name: "PlaygroundsTests",
            dependencies: ["Playgrounds"]),
    ]
)
