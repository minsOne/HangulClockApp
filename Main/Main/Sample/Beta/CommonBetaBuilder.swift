//
//  CommonBetaBuilder.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

protocol CommonBetaDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var commonBetaViewController: CommonBetaViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
    var nextBuilder: ((Int) -> Routing) { get }
}

final class CommonBetaComponent: Component<CommonBetaDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var viewController: CommonBetaViewControllable {
        return dependency.commonBetaViewController
    }

    fileprivate var nextBuilder: ((Int) -> Routing) {
        return dependency.nextBuilder
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CommonBetaBuildable: Buildable {
    func build(withListener listener: CommonBetaListener) -> CommonBetaRouting
}

final class CommonBetaBuilder: Builder<CommonBetaDependency>, CommonBetaBuildable {

    override init(dependency: CommonBetaDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CommonBetaListener) -> CommonBetaRouting {
        let component = CommonBetaComponent(dependency: dependency)
        let interactor = CommonBetaInteractor()
        interactor.listener = listener
        return CommonBetaRouter(interactor: interactor,
                                viewController: component.viewController,
                                nextBuilder: component.nextBuilder)
    }
}
