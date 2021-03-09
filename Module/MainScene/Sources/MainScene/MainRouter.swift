//
//  MainRouter.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import Settings

public protocol MainInteractable: Interactable, SettingsListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

public protocol MainViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

public final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
    public init(interactor: MainInteractable,
                settingsBuilder: SettingsBuildable,
                viewController: MainViewControllable) {
        self.settingsBuilder = settingsBuilder
        super.init(interactor: interactor,
                   viewController: viewController)
        interactor.router = self
    }
    
    private let settingsBuilder: SettingsBuildable    
    private var currentChild: ViewableRouting?
}

public extension MainRouter {
    func routeToSettings() {
        guard currentChild == nil else { return }
        let router = settingsBuilder.build(withListener: interactor)
        currentChild = router
        router.viewControllable.uiviewController.isModalInPresentation = true
        viewController.present(viewController: router.viewControllable)
    }
    
    func detachSettings() {
        guard let currentChild = currentChild as? SettingsRouting else { return }
        detachChild(currentChild)
        viewController.dismiss(viewController: currentChild.viewControllable)
        self.currentChild = nil
    }
}
