//
//  CharlieRouter.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

protocol CharlieInteractable: Interactable {
    var router: CharlieRouting? { get set }
    var listener: CharlieListener? { get set }
}

protocol CharlieViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class CharlieRouter: Router<CharlieInteractable>, CharlieRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: CharlieInteractable, viewController: CharlieViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    // MARK: - Private

    private let viewController: CharlieViewControllable
}
