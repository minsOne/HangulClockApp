//
//  AlphaBuilder.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

protocol AlphaDependency: Dependency {}

final class AlphaComponent: Component<AlphaDependency>, CommonBetaDependency {
    var commonBetaViewController: CommonBetaViewControllable
    var nextBuilder: ((Int) -> Routing)
    
    init(dependency: AlphaDependency,
         viewController: CommonBetaViewControllable,
         nextBuilder: @escaping ((Int) -> Routing)) {
        self.commonBetaViewController = viewController
        self.nextBuilder = nextBuilder
        super.init(dependency: dependency)
    }
}

private final class CharlieWrapperComponent: CharlieDependency {
    var charlieViewController: CharlieViewControllable
    init(viewController: CharlieViewControllable) {
        self.charlieViewController = viewController
    }
}

// MARK: - Builder

protocol AlphaBuildable: Buildable {
    func build(withListener listener: AlphaListener) -> AlphaRouting
}

final class AlphaBuilder: Builder<AlphaDependency>, AlphaBuildable {

    override init(dependency: AlphaDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AlphaListener) -> AlphaRouting {
        let viewController = AlphaViewController()
        let interactor = AlphaInteractor(presenter: viewController)
        let charlieComponent = CharlieWrapperComponent(viewController: viewController)
        let nextBuilder: ((Int) -> Routing) = { value in
            CharlieBuilder(dependency: charlieComponent)
                .build(withListener: interactor)
        }
        
        let component = AlphaComponent(dependency: dependency,
                                       viewController: viewController,
                                       nextBuilder: nextBuilder)
        interactor.listener = listener
        
        let betaBuilder = CommonBetaBuilder(dependency: component)
        
        return AlphaRouter(interactor: interactor,
                           viewController: viewController,
                           betaBuilder: betaBuilder)
    }
}
