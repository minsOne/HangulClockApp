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
    
    // Feature
    static let Settings: TargetDependency = .project(target: "Settings", path: .relativeToRoot("Module/Settings"))
    static let Main: TargetDependency = .project(target: "Main", path: .relativeToRoot("Module/Main"))
}

// MARK: Package
public extension TargetDependency {
    static let Resource: TargetDependency = .package(product: "Resource")
    static let Umbrella: TargetDependency = .package(product: "Umbrella")
}

public extension Package {
    static let resouce: Package = .local(path: .relativeToRoot("Module/Resource"))
    static let umbrella: Package = .local(path: .relativeToRoot("Module/Umbrella"))
}
