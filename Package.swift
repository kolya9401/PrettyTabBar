// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrettyTabBar",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "PrettyTabBar",
            targets: [
                "PrettyTabBar"
            ]
        ),
    ],
    targets: [
        .target(
            name: "PrettyTabBar",
            dependencies: [
            ],
            path: "Sources"
        ),
    ]
)
