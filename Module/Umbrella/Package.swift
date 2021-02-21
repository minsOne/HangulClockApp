// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Umbrella",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Umbrella",
            targets: ["Umbrella"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift", from: "5.1.1"),
        .package(name: "RIBs", url: "https://github.com/uber/RIBs", .branch("master")),
        .package(name: "PureSwiftUI", url: "https://github.com/CodeSlicing/pure-swift-ui.git", from: "2.0.5"),
        .package(name: "PureSwiftUITools", url: "https://github.com/CodeSlicing/pure-swift-ui-tools.git", from: "2.0.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Umbrella",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxBlocking", package: "RxSwift"),
                .product(name: "RIBs", package: "RIBs"),
                .product(name: "PureSwiftUI", package: "PureSwiftUI"),
                .product(name: "PureSwiftUITools", package: "PureSwiftUITools")
            ]),
        .testTarget(
            name: "UmbrellaTests",
            dependencies: ["Umbrella"]),
    ]
)
