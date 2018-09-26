// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-syntax-checker",
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", .branch("0.40200.0")),
    ],
    targets: [
        .target(
            name: "swift-syntax-checker",
            dependencies: ["SwiftSyntax"]),
        .testTarget(
            name: "swift-syntax-checkerTests",
            dependencies: ["swift-syntax-checker"]),
    ]
)
