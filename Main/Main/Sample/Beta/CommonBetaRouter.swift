//
//  CommonBetaRouter.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

protocol CommonBetaInteractable: Interactable {
    var router: CommonBetaRouting? { get set }
    var listener: CommonBetaListener? { get set }
}

protocol CommonBetaViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class CommonBetaRouter: Router<CommonBetaInteractable>, CommonBetaRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: CommonBetaInteractable,
         viewController: CommonBetaViewControllable,
         nextBuilder: @escaping ((Int) -> Routing)) {
        self.viewController = viewController
        self.nextBuilder = nextBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    func next() {
        let router = nextBuilder(10)
        self.nextRouting = router
        attachChild(router)
    }

    // MARK: - Private

    private let viewController: CommonBetaViewControllable
    
    private let nextBuilder: ((Int) -> Routing)
    private var nextRouting: Routing?
}
