//
//  CharlieBuilder.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

protocol CharlieDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var charlieViewController: CharlieViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class CharlieComponent: Component<CharlieDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var viewController: CharlieViewControllable {
        return dependency.charlieViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CharlieBuildable: Buildable {
    func build(withListener listener: CharlieListener) -> CharlieRouting
}

final class CharlieBuilder: Builder<CharlieDependency>, CharlieBuildable {

    override init(dependency: CharlieDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CharlieListener) -> CharlieRouting {
        let component = CharlieComponent(dependency: dependency)
        let interactor = CharlieInteractor()
        interactor.listener = listener
        return CharlieRouter(interactor: interactor, viewController: component.viewController)
    }
}
