//
//  UserProfileBuilder.swift
//  UserProfile
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import Settings
import Resource
import UIKit

public protocol UserProfileDependency: Dependency {
    var name: String { get }
    var age: UInt { get }
    var address: String { get }
}

@dynamicMemberLookup
final class UserProfileComponent: Component<UserProfileDependency> {
    let name: [String] = ["Hello world"]
    let address: String = "Korea"
    
    override init(dependency: UserProfileDependency) {
        super.init(dependency: dependency)
    }
    subscript<U>(dynamicMember keyPath: KeyPath<UserProfileDependency, U>) -> U {
        dependency[keyPath: keyPath]
    }
}

public protocol UserProfileBuildable: Buildable {
    func build() -> UserProfileRouting
}
public final class UserProfileBuilder: Builder<UserProfileDependency>, UserProfileBuildable {

    public override init(dependency: UserProfileDependency) {
        super.init(dependency: dependency)
    }

    public func build() -> UserProfileRouting {
        let component = UserProfileComponent(dependency: dependency)
        _ = component.name
        _ = component.age
        _ = component.address
        
        
        
        
        let viewController = UserProfileViewController(bgColor: component.bgColor)
        let settingsBuilder = SettingsBuilder(dependency: component)
        let interactor = UserProfileInteractor(presenter: viewController,
                                        timeIntervalService: component.timeIntervalService,
                                        dateFormatService: component.dateFormatService)
        return UserProfileRouter(interactor: interactor,
                          settingsBuilder: settingsBuilder,
                          viewController: viewController)
    }
}

extension UserProfileComponent {
    var colors: [R.Color] {
        []
    }
}

public protocol UserProfileRouting {
    
}
