// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-syntax-check",
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["SwiftSyntaxCheck", "Utility"]
        ),
        .target(
            name: "SwiftSyntaxCheck",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftSyntaxCheckTests",
            dependencies: ["SwiftSyntaxCheck"]
        ),
    ]
)
