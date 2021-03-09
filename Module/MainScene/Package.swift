// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainScene",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MainScene",
            targets: ["MainScene"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../Umbrella"),
        .package(path: "../Resource"),
        .package(path: "../Settings"),
        .package(path: "../FoundationExtension"),
        .package(path: "../HangulClockTable"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MainScene",
            dependencies: ["Umbrella",
                           "Resource",
                           "Settings",
                           "FoundationExtension",
                           "HangulClockTable"
            ]),
        .testTarget(
            name: "MainSceneTests",
            dependencies: ["MainScene"]),
    ]
)
