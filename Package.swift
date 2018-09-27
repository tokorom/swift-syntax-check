// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-syntax-check",
    dependencies: [],
    targets: [
        .target(
            name: "swift-syntax-check",
            dependencies: []),
        .testTarget(
            name: "swift-syntax-checkTests",
            dependencies: ["swift-syntax-check"]),
    ]
)
