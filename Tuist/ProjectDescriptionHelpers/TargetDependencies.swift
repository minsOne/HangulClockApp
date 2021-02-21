//
//  TargetDependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by minsone on 2021/02/20.
//

import ProjectDescription

// MARK: Project
public extension TargetDependency {
    static let AnalyticsKit: TargetDependency = .project(target: "AnalyticsKit", path: .relativeToRoot("Module/AnalyticsKit"))
    static let FoundationExtension: TargetDependency = .project(target: "FoundationExtension", path: .relativeToRoot("Module/FoundationExtension"))
    static let HangulClockTable: TargetDependency = .project(target: "HangulClockTable", path: .relativeToRoot("Module/HangulClockTable"))
    static let UmbrellaSwiftPM: TargetDependency = .project(target: "UmbrellaSwiftPM", path: .relativeToRoot("Module/UmbrellaSwiftPM"))
    
    // Feature
    static let Settings: TargetDependency = .project(target: "Settings", path: .relativeToRoot("Module/Settings"))
    static let Main: TargetDependency = .project(target: "Main", path: .relativeToRoot("Module/Main"))
}

// MARK: Package
public extension TargetDependency {
    static let RIBs: TargetDependency = .package(product: "RIBs")
    static let RxSwift: TargetDependency = .package(product: "RxSwift")
    static let RxRelay: TargetDependency = .package(product: "RxRelay")
    static let RxCocoa: TargetDependency = .package(product: "RxCocoa")
    static let RxBlocking: TargetDependency = .package(product: "RxBlocking")
    static let PureSwiftUI: TargetDependency = .package(product: "PureSwiftUI")
    static let PureSwiftUITools: TargetDependency = .package(product: "PureSwiftUITools")
    
    static let Resource: TargetDependency = .package(product: "Resource")
}

public extension Package {
    static let ribs: Package = .package(url: "https://github.com/uber/RIBs", .branch("master"))
    static let pure_swift_ui: Package = .package(url: "https://github.com/CodeSlicing/pure-swift-ui.git",
                                                 .upToNextMajor(from: "1.15.1"))
    static let pure_swift_ui_tools: Package = .package(url: "https://github.com/CodeSlicing/pure-swift-ui-tools.git",
                                                       .upToNextMajor(from: "1.3.0"))
    static let resouce: Package = .local(path: .relativeToRoot("Module/Resource"))
}
