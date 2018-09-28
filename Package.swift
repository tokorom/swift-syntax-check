// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-syntax-check",
    dependencies: [],
    targets: [
        .target(
            name: "Main",
            dependencies: ["SwiftSyntaxCheck"]
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
