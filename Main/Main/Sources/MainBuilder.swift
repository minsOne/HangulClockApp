//
//  MainBuilder.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import Settings
import Resource

public protocol MainDependency: Dependency {
    var timeIntervalService: TimeIntervalServicable { get }
    var dateFormatService: DateFormatServicable { get }
    var bgColor: UIColor { get }
}

public extension MainDependency {
    var timeIntervalService: TimeIntervalServicable {
        TimeIntervalService()
    }
    var dateFormatService: DateFormatServicable {
        DateFormatService()
    }
}

final class MainComponent: Component<MainDependency>, SettingsDependency {
    var colors: [R.Color] {
        R.ThemeColor.list
    }

    fileprivate let timeIntervalService: TimeIntervalServicable
    fileprivate let dateFormatService: DateFormatServicable
    fileprivate let bgColor: UIColor
    
    override init(dependency: MainDependency) {
        self.timeIntervalService = dependency.timeIntervalService
        self.dateFormatService = dependency.dateFormatService
        self.bgColor = dependency.bgColor
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

public protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

public final class MainBuilder: Builder<MainDependency>, MainBuildable {

    public override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    public func build() -> LaunchRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController(bgColor: component.bgColor)
        let settingsBuilder = SettingsBuilder(dependency: component)
        let interactor = MainInteractor(presenter: viewController,
                                        timeIntervalService: component.timeIntervalService,
                                        dateFormatService: component.dateFormatService)
        return MainRouter(interactor: interactor,
                          settingsBuilder: settingsBuilder,
                          viewController: viewController)
    }
}
