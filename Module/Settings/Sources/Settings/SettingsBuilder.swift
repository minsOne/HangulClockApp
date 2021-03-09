//
//  SettingsBuilder.swift
//  Settings
//
//  Created by minsone on 2020/02/09.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import Resource

public protocol SettingsDependency: Dependency {
    var colors: [R.Color] { get }
}

final class SettingsComponent: Component<SettingsDependency> {
    fileprivate let colors: [R.Color]
    override init(dependency: SettingsDependency) {
        self.colors = dependency.colors
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

public protocol SettingsBuildable: Buildable {
    func build(withListener listener: SettingsListener) -> SettingsRouting
}

public final class SettingsBuilder: Builder<SettingsDependency>, SettingsBuildable {

    public override init(dependency: SettingsDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: SettingsListener) -> SettingsRouting {
        let component = SettingsComponent(dependency: dependency)
        let viewState = SettingsViewState(colors: component.colors)
        let viewController = SettingsViewController(viewState: viewState)
        let interactor = SettingsInteractor(presenter: viewController)
        interactor.listener = listener
        return SettingsRouter(interactor: interactor, viewController: viewController)
    }
}
