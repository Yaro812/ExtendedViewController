// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExtendedViewController",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
        name: "ExtendedViewController",
        targets: ["ExtendedViewController"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
        name: "ExtendedViewController",
        dependencies: []),
        .testTarget(
        name: "ExtendedViewControllerTests",
        dependencies: ["ExtendedViewController"]),
  ]
)
