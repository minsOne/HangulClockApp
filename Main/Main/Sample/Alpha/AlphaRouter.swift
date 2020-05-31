//
//  AlphaRouter.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

protocol AlphaInteractable: Interactable, CommonBetaListener, CharlieListener {
    var router: AlphaRouting? { get set }
    var listener: AlphaListener? { get set }
}

protocol AlphaViewControllable: ViewControllable, CommonBetaViewControllable, CharlieViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AlphaRouter: ViewableRouter<AlphaInteractable, AlphaViewControllable>, AlphaRouting {
    func beta() {
        let router = betaBuilder.build(withListener: interactor)
        betaRouter = router
        attachChild(router)
    }
    

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AlphaInteractable,
         viewController: AlphaViewControllable,
         betaBuilder: CommonBetaBuildable) {
        self.betaBuilder = betaBuilder
        super.init(interactor: interactor,
                   viewController: viewController)
        interactor.router = self
    }
    
    private let betaBuilder: CommonBetaBuildable
    private var betaRouter: CommonBetaRouting?
}
